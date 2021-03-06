<?php
	/**
	 * Beinhaltet die benötigten routen
	 *
	 * author: EorlBrother
	 * date: 25.11.14
	 */
	require_once('server/recipeDao.php');
	require_once('server/ingredientsDao.php');
	require_once('server/userDao.php');
	require_once('server/fridgeDao.php');

	$config = parse_ini_file('config/ris.ini');
	$f3 = require($config['fatfree_path']);
	include($config['log4php_path']);

	$sessionDao = new Dao();

	header("Content-type:text/html; charset=utf-8");

	// Tell log4php to use our configuration file.
	Logger::configure('config/log4php.xml');


	/**
	 * Rendert das Seitenlayout
	 */
	function render_layout($f3, $content) {
		$recipe_dao = new RecipeDao();
		$fridge_dao = new FridgeDao();

		$userid = $f3->get('SESSION.userID');
		if(!$userid) {
			$userid = -1;
			$re = "/([^.\\/]+).html/";

			preg_match($re, $content, $matches);
			if(!in_array($matches[1], array('index_not_logged_in', 'login', 'registrieren'))) {
				$f3->reroute('please_log_in');
			}
		}
		if($userid) {
			$f3->set('favorites_results', $recipe_dao->getFavoritesForCustomer($userid));
			$f3->set('fridge_results', $fridge_dao->getFridgeForCustomer($userid));

		}
		setArea($f3, 'content', $content);
		setArea($f3, 'favorites', buildViewPath('layout/favorites'));
		setArea($f3, 'favorites_content', buildViewPath('favorites_content'));
		setArea($f3, 'kuehlschrank', buildViewPath('layout/kuehlschrank'));
		setArea($f3, 'upper_navbar', buildViewPath('layout/upper_navbar'));
		setArea($f3, 'lower_navbar', buildViewPath('layout/lower_navbar'));
		setArea($f3, 'footer', buildViewPath('layout/footer'));
		echo Template::instance()->render(buildViewPath('layout/layout'),'text/html');
	}

	/**
	 * Setzt den Content
	 */
	function setArea($f3, $area, $content)
	{
		$f3->set($area,$content);
	}

	/**
	 * Baut Pfad zu der richtigen views/*.html
	 */
	function buildViewPath($page)
	{
		return 'views/'.$page.'.html';
	}

	$f3->route('GET /please_log_in',
		function($f3) {
			render_layout($f3, buildViewPath('login'));
		});
	/**
	 * Login
	 */
	$f3->route('POST /login',
		function($f3)
		{
			$f3->clear('SESSION');
			$dao = new UserDao();
			$userMail = $f3->get('POST.loginMail');
			$userPW = $f3->get('POST.loginPW');
			$result = $dao->login($userMail, $userPW);
			if($result == 1) {
				$f3->set('SESSION.userMail', $userMail);
				$f3->set('SESSION.userID', $dao->getCustomerIDByEmail($userMail));
				echo $userMail;
			}
		}
	);

	/**
	 * Registrieren
	 */
	$f3->route('POST /register',
		function($f3)
		{
			$f3->clear('SESSION');
			$dao = new UserDao();
			$dao->createCustomer($f3->get('POST'));
			$f3->reroute('/');
		}
	);

	/**
	 * Logout
	 */
	$f3->route('GET /logout',
		function($f3)
		{
			$f3->clear('SESSION');
			print_r($f3->get('SESSION'));
		}
	);

	/**
	 * Rezepteanzeige
	 */
	$f3->route('GET /recipe/@id',
		function($f3)
		{
			$recipeid = $f3->get('PARAMS.id');
			$dao = new RecipeDao();
			$result = $dao->findById($f3->get('PARAMS.id'))[0];
			$favs = $dao->getFavoritesForCustomer($f3->get('SESSION.userID'));
			$favo_key = array_search($result['name'], array_column($favs, 'name'));
			$result['ingredients'] = $dao->getIngredientsForRecipe($recipeid);
			$result['pictures'] = $dao->getPicturesForRecipe($recipeid);
			if ($favo_key !== FALSE) {
				$result['favo'] = 'true';
			} else {
				$result['favo'] = 'false';
			}
			$f3->set('result', $result);
			render_layout($f3, buildViewPath('rezept'));
		}
	);

	/**
	 * Rezeptesuche
	 */
	$f3->route('GET /recipe_search_results/@name',
		function($f3)
		{
			$dao = new RecipeDao();
			$results = $dao->findByName($f3->get('PARAMS.name'));
			$f3->set('results', $results);
			render_layout($f3, buildViewPath('rezeptsuchanzeige'));
		}
	);

	/**
	 * Zutatensuche
	 */
	$f3->route('GET /ingredient_search_results/@name',
		function($f3)
		{
			$dao = new IngredientDao();
			$results = $dao->findByName($f3->get('PARAMS.name'));
			$f3->set('results', $results);
			render_layout($f3, buildViewPath('zutatensuchanzeige'));
		}
	);

	/**
	 * Zutatenanzeige
	 */
	$f3->route('GET /ingredient/@id',
		function($f3)
		{
			$dao = new IngredientDao();
			$result = $dao->findById($f3->get('PARAMS.id'))[0];
			$result['pictures'] = $dao->getPicturesForIngredient($f3->get('PARAMS.id'));
			$f3->set('result', $result);
			render_layout($f3, buildViewPath('zutat'));
		}
	);

    /**
	 * Rezept erstellen - Submit
	 */
	$f3->route('POST /rezepterstellen/submit',
		function($f3) {
			$dao = new RecipeDao($f3);
			$result = $dao->createRecipe($f3->get('POST'));
			$f3->reroute('/success');
		}
	);

	/**
	 * Rezept/Zutat erstellen - Success (or Failure, actually ..)
	 */
	$f3->route('GET /success',
		function($f3) {
			render_layout($f3, buildViewPath('tmp_success_seite'));
		}
	);

	/**
	 * Zutat erstellen
	 */
	$f3->route('GET /zutatenerstellen',
		function($f3) {
			$dao = new IngredientDao();
			$result = $dao->getAllUnits();
			$f3->set('result', $result);
			render_layout($f3, buildViewPath('zutatenerstellen'));
		}
	);

	/**
	 * Zutat erstellen - Submit
	 */
	$f3->route('POST /zutatenerstellen/submit',
		function($f3) {
			$dao = new IngredientDao();
			$dao->createIngredient($f3->get('POST'));
			$f3->reroute('/success');
		}
	);

	/**
	 * Rezept favorisieren
	 */
	$f3->route('POST /rezeptfavo',
		function($f3) {
			$dao = new RecipeDao($f3);
			$result = $dao->addFavoriteForCustomer($f3->get('POST.recipeid'));
			$f3->reroute('/success');
		}
	);

	/**
	 * Rezept entfavorisieren
	 */
	$f3->route('POST /rezeptunfavo',
		function($f3) {
			$dao = new RecipeDao($f3);
			$result = $dao->removeFavoriteForCustomer($f3->get('POST.recipeid'));
			$f3->reroute('/success');
		}
	);

	/**
	 * temporäre Rezeptsuche nach Zutaten
	 */
	$f3->route('GET /rezeptzutatensuche',
		function($f3)
		{
			$dao = new IngredientDao();
			$result = $dao->getAllIngredients();
			$f3->set('result', $result);
			render_layout($f3, 'views/rezeptzutatensuche.html');
		}
	);

	/**
	 * temporäre Rezeptsuche search
	 */
	$f3->route('GET /rezeptzutatensuche/search/@searchString',
		function($f3)
		{
			$dao = new RecipeDao($f3);
			$searchString = $f3->get('PARAMS.searchString');
			$result = $dao->searchRecipesByIngredient('"' . $searchString . '"');
			$f3->set('result', $result);
			if (!sizeof($result)) {
				$f3->set('result', '');
			}
			render_layout($f3, 'views/rezeptzutatensuche_result.html');		
		}
	);

	/**
	 * index.html wird als content verwendet
	 */
	$f3->route('GET /',
		function($f3)
		{
			if ($f3->get('SESSION.userID')) {
				render_layout($f3, 'views/index.html');
			} else {
				render_layout($f3, 'views/index_not_logged_in.html');
			}
		}
	);

	/**
	 * Catchall für alle Seiten, die keine besonderen Regeln brauchen
	 */
	$f3->route('GET /@page',
		function($f3)
		{
			render_layout($f3, buildViewPath($f3->get('PARAMS.page')));
		}
	);

	$f3->run();

?>
