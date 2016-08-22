 <?php
    
    /**
 * html代码输出
 * @param unknown $str
 * @return string
 */
function html_out($str) {
    if (function_exists('htmlspecialchars_decode')) {
        $str = htmlspecialchars_decode($str);
    } else {
        $str = html_entity_decode($str);
    }
    $str = stripslashes($str);
    return $str;
}
