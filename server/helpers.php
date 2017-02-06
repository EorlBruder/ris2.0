<?php
	/**
	 * Globale Hilfsfunktionen
	 */
	 class Helpers {
		/**
		 * Setzt eine beliebige Variable in einfache Anführungszeichen - für SQL Query
		 * @param  $var 		die Variable die stringified werden soll
		 * @return string      "'$var'"
		 */
		private static function stringify($var) {
			return "'".$var."'";
		}

		/**
		 * Baut einen String aus einem POST-Objekt
		 * @param  array $postData  	POST Objekt aus einer HTML formPostStringBuilder
		 * @param  array $keepArray 	Array mit allen POST-Elementen, die im String landen SDO_Model_ReflectionDataObject
		 * @return String            	fertiger String, durch Kommata getrennt
		 */
		public static function formPostStringBuilder($postData, $keepArray) {
			$returnString = "";
			foreach ($postData as $key => $value) {
 				if (in_array($key, $keepArray)) {
 					$returnString .= self::stringify($value) . ', ';
 				}
 			}
			return rtrim($returnString, " ,"); // cut off the last comma
		 }
	 }
?>
