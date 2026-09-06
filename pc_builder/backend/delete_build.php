<?php

require "../config/db.php";

header("Content-Type: application/json");

$data = json_decode(file_get_contents("php://input"), true);

$buildID = $data["buildID"] ?? null;

if (!$buildID) {
    echo json_encode([
        "success" => false,
        "message" => "Build ID is required."
    ]);
    exit;
}

try {

    $conn->begin_transaction();

    $stmt = $conn->prepare(
        "DELETE FROM build_component WHERE Build_ID = ?"
    );

    $stmt->bind_param("i", $buildID);
    $stmt->execute();
    $stmt->close();

    $stmt = $conn->prepare(
        "DELETE FROM build WHERE Build_ID = ?"
    );

    $stmt->bind_param("i", $buildID);
    $stmt->execute();

    if ($stmt->affected_rows === 0) {

        $stmt->close();
        $conn->rollback();

        echo json_encode([
            "success" => false,
            "message" => "Build not found."
        ]);

        exit;
    }

    $stmt->close();

    $conn->commit();

    echo json_encode([
        "success" => true,
        "message" => "Build deleted successfully."
    ]);

} catch (Exception $e) {

    $conn->rollback();

    echo json_encode([
        "success" => false,
        "message" => $e->getMessage()
    ]);
}

$conn->close();

?>