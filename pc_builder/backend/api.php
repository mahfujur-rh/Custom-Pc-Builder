<?php

require "../config/db.php";

header("Content-Type: application/json");

$data = [];

$tables = [
    "cpu" => "CPU",
    "motherboard" => "Motherboard",
    "gpu" => "GPU",
    "ram" => "RAM",
    "storage" => "Storage",
    "psu" => "PSU",
    "case" => "PC_Case"
];

foreach ($tables as $key => $table) {

    $result = $conn->query("SELECT * FROM `$table`");

    if (!$result) {
        http_response_code(500);
        echo json_encode([
            "error" => "Failed to retrieve $table"
        ]);
        exit;
    }

    $data[$key] = $result->fetch_all(MYSQLI_ASSOC);
}

echo json_encode($data);

?>