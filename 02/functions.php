<?php

function generateHtmlTable($data) {
    if (empty($data)) {
        return "<p>Brak danych do wyświetlenia.</p>";
    }
    
    $html = "<table border='1' cellspacing='0' cellpadding='5'>";
    $html .= "<tr>";
    foreach (array_keys($data[0]) as $column) {
        $html .= "<th>" . htmlspecialchars($column) . "</th>";
    }
    $html .= "</tr>";
    
    foreach ($data as $row) {
        $html .= "<tr>";
        foreach ($row as $value) {
            $html .= "<td>" . htmlspecialchars($value) . "</td>";
        }
        $html .= "</tr>";
    }
    
    $html .= "</table>";
    return $html;
}