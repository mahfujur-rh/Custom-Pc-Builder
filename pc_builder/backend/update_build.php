<?php

require "../config/db.php";

header("Content-Type: application/json");

$data = json_decode(file_get_contents("php://input"), true);

if (!$data) {
    echo json_encode([
        "success" => false,
        "message" => "Invalid request data."
    ]);
    exit;
}

$buildID = $data["buildID"] ?? null;
$buildName = trim($data["buildName"] ?? "");

$cpuID = $data["cpuID"] ?? null;
$motherboardID = $data["motherboardID"] ?? null;
$gpuID = $data["gpuID"] ?? null;
$ramID = $data["ramID"] ?? null;
$storageID = $data["storageID"] ?? null;
$psuID = $data["psuID"] ?? null;
$caseID = $data["caseID"] ?? null;
$totalPrice = $data["totalPrice"] ?? null;

if (
    !$buildID ||
    $buildName === "" ||
    !$cpuID ||
    !$motherboardID ||
    !$gpuID ||
    !$ramID ||
    !$storageID ||
    !$psuID ||
    !$caseID ||
    $totalPrice === null
) {
    echo json_encode([
        "success" => false,
        "message" => "All build information is required."
    ]);
    exit;
}

$stmt = $conn->prepare(
    "UPDATE build
     SET Build_Name = ?,
         CPU_ID = ?,
         Motherboard_ID = ?,
         GPU_ID = ?,
         RAM_ID = ?,
         Storage_ID = ?,
         PSU_ID = ?,
         Case_ID = ?,
         Total_Price = ?
     WHERE Build_ID = ?"
);

$stmt->bind_param(
    "siiiiiiidi",
    $buildName,
    $cpuID,
    $motherboardID,
    $gpuID,
    $ramID,
    $storageID,
    $psuID,
    $caseID,
    $totalPrice,
    $buildID
);

if ($stmt->execute()) {

    echo json_encode([
        "success" => true,
        "message" => "Build updated successfully."
    ]);

} else {

    echo json_encode([
        "success" => false,
        "message" => "Failed to update build."
    ]);
}

$stmt->close();
$conn->close();

?>