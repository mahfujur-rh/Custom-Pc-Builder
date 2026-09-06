<?php

require "../config/db.php";

$sql = "SELECT 
            Build_ID,
            Build_Name,
            Total_Price,
            CPU_ID,
            Motherboard_ID,
            GPU_ID,
            RAM_ID,
            Storage_ID,
            PSU_ID,
            Case_ID
        FROM build
        ORDER BY Build_ID DESC";

$result = $conn->query($sql);

$builds = [];

while ($row = $result->fetch_assoc()) {
    $builds[] = $row;
}

echo json_encode([
    "success" => true,
    "builds" => $builds
]);