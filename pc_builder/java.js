let data = {
    cpu: [],
    motherboard: [],
    gpu: [],
    ram: [],
    storage: [],
    psu: [],
    case: []
};

const categories = [
    "cpu",
    "motherboard",
    "gpu",
    "ram",
    "storage",
    "psu",
    "case"
];

const labels = {
    cpu: "CPU",
    motherboard: "Motherboard",
    gpu: "GPU",
    ram: "RAM",
    storage: "Storage",
    psu: "PSU",
    case: "Case"
};

let databaseBuilds = [];
let selectedBuildID = null;


async function loadComponentData() {

    try {

        const response =
            await fetch("backend/api.php");

        const dbData =
            await response.json();


        data = {

            cpu: dbData.cpu.map(item => ({
                id: item.CPU_ID,
                name: `${item.Brand} ${item.Model}`,
                socket: item.Socket,
                price: Number(item.Price)
            })),

            motherboard: dbData.motherboard.map(item => ({
                id: item.Motherboard_ID,
                name: `${item.Brand} ${item.Model}`,
                socket: item.Socket,
                price: Number(item.Price)
            })),

            gpu: dbData.gpu.map(item => ({
                id: item.GPU_ID,
                name: `${item.Brand} ${item.Model}`,
                price: Number(item.Price)
            })),

            ram: dbData.ram.map(item => ({
                id: item.RAM_ID,
                name: `${item.Brand} ${item.Model}`,
                price: Number(item.Price)
            })),

            storage: dbData.storage.map(item => ({
                id: item.Storage_ID,
                name: `${item.Brand} ${item.Model}`,
                price: Number(item.Price)
            })),

            psu: dbData.psu.map(item => ({
                id: item.PSU_ID,
                name: `${item.Brand} ${item.Model}`,
                price: Number(item.Price)
            })),

            case: dbData.case.map(item => ({
                id: item.Case_ID,
                name: `${item.Brand} ${item.Model}`,
                price: Number(item.Price)
            }))
        };


        categories.forEach(category => {

            populateDropdown(
                category,
                data[category]
            );

        });


        updateBuild();


    } catch (error) {

        console.error(error);

        alert(
            "Failed to load component data from the database."
        );

    }
}


function populateDropdown(id, items) {

    const select =
        document.getElementById(id);

    select.innerHTML = "";


    const placeholder =
        document.createElement("option");

    placeholder.value = "";

    placeholder.textContent =
        "Select " + labels[id];

    placeholder.selected = true;

    select.appendChild(placeholder);


    items.forEach((item, index) => {

        const option =
            document.createElement("option");

        option.value = index;

        option.textContent = item.name;

        select.appendChild(option);

    });
}

function getCurrentBuild() {

    const build = {

        buildName:
            document.getElementById(
                "buildName"
            ).value,

        total: 0

    };


    categories.forEach(category => {

        const index =
            document.getElementById(
                category
            ).value;


        if (index === "") {

            build[category] = null;

            return;
        }


        const item =
            data[category][index];


        build[category] = item;

        build.total += item.price;

    });


    return build;
}

function updateBuild() {

    let total = 0;

    let summary = "";


    categories.forEach(category => {

        const index =
            document.getElementById(
                category
            ).value;


        if (index === "") {
            return;
        }


        const item =
            data[category][index];


        if (!item) {
            return;
        }


        total += item.price;


        summary += `
            <tr>
                <td>${category.toUpperCase()}</td>
                <td>${item.name}</td>
            </tr>
        `;

    });


    document.getElementById(
        "summary"
    ).innerHTML = summary;


    document.getElementById(
        "total"
    ).textContent =
        "৳" + total.toLocaleString();


    const cpuIndex =
        document.getElementById(
            "cpu"
        ).value;


    const motherboardIndex =
        document.getElementById(
            "motherboard"
        ).value;


    const compatibility =
        document.getElementById(
            "compatibility"
        );


    if (
        cpuIndex === "" ||
        motherboardIndex === ""
    ) {

        compatibility.textContent =
            "Select CPU and Motherboard";

        compatibility.style.background =
            "#666";

        return;
    }


    const cpu =
        data.cpu[cpuIndex];


    const motherboard =
        data.motherboard[motherboardIndex];


    if (
        cpu.socket ===
        motherboard.socket
    ) {

        compatibility.textContent =
            "✓ Compatible (" +
            cpu.socket +
            ")";

        compatibility.style.background =
            "#00b050";

    } else {

        compatibility.textContent =
            "✗ CPU Socket Mismatch";

        compatibility.style.background =
            "#d32f2f";

    }
}


async function saveBuild() {

    const build =
        getCurrentBuild();


    if (
        build.buildName.trim() === ""
    ) {

        alert(
            "Please enter a build name."
        );

        return;
    }


    if (
        !build.cpu ||
        !build.motherboard ||
        !build.gpu ||
        !build.ram ||
        !build.storage ||
        !build.psu ||
        !build.case
    ) {

        alert(
            "Please select all components."
        );

        return;
    }


    if (
        build.cpu.socket !==
        build.motherboard.socket
    ) {

        alert(
            "Cannot save an incompatible build."
        );

        return;
    }


    try {

        const response =
            await fetch(
                "backend/save_build.php",
                {
                    method: "POST",

                    headers: {
                        "Content-Type":
                            "application/json"
                    },

                    body: JSON.stringify({

                        buildName:
                            build.buildName,

                        cpuID:
                            build.cpu.id,

                        motherboardID:
                            build.motherboard.id,

                        gpuID:
                            build.gpu.id,

                        ramID:
                            build.ram.id,

                        storageID:
                            build.storage.id,

                        psuID:
                            build.psu.id,

                        caseID:
                            build.case.id,

                        totalPrice:
                            build.total
                    })
                }
            );


        const result =
            await response.json();


        if (!result.success) {

            alert(
                "Failed to save build: " +
                result.message
            );

            return;
        }


        await loadSavedBuilds();


        updateSelectedBuild(
            build.buildName
        );


        alert(
            "Build saved successfully!"
        );


    } catch (error) {

        console.error(
            "Save build error:",
            error
        );

        alert(
            "An error occurred while saving the build."
        );

    }
}


async function loadSavedBuilds() {

    try {

        const response =
            await fetch(
                "backend/load_build.php"
            );


        const result =
            await response.json();


        if (!result.success) {

            alert(
                "Failed to load saved builds."
            );

            return;
        }


        databaseBuilds =
            result.builds;


        refreshSavedBuildsTable();


    } catch (error) {

        console.error(
            "Load builds error:",
            error
        );

        alert(
            "Failed to load saved builds."
        );

    }
}


function refreshSavedBuildsTable() {

    const list =
        document.getElementById(
            "savedBuildsList"
        );


    list.innerHTML = "";


    databaseBuilds.forEach(build => {

        list.innerHTML += `

            <tr>

                <td>
                    ${build.Build_Name}
                </td>

                <td>
                    ৳${Number(
                        build.Total_Price
                    ).toLocaleString()}
                </td>

                <td>

                    <button
                        type="button"
                        onclick="loadBuild(${build.Build_ID})">

                        View

                    </button>

                </td>

            </tr>

        `;

    });
}


function loadBuild(buildID) {

    const build =
        databaseBuilds.find(
            item =>
                Number(item.Build_ID) ===
                Number(buildID)
        );


    if (!build) {

        alert(
            "Build not found."
        );

        return;
    }


    selectedBuildID =
        Number(build.Build_ID);


    document.getElementById(
        "buildName"
    ).value =
        build.Build_Name;


    categories.forEach(category => {

        let databaseID;


        if (category === "cpu") {
            databaseID = build.CPU_ID;
        }

        else if (
            category === "motherboard"
        ) {
            databaseID =
                build.Motherboard_ID;
        }

        else if (category === "gpu") {
            databaseID =
                build.GPU_ID;
        }

        else if (category === "ram") {
            databaseID =
                build.RAM_ID;
        }

        else if (category === "storage") {
            databaseID =
                build.Storage_ID;
        }

        else if (category === "psu") {
            databaseID =
                build.PSU_ID;
        }

        else if (category === "case") {
            databaseID =
                build.Case_ID;
        }


        const index =
            data[category].findIndex(
                item =>
                    Number(item.id) ===
                    Number(databaseID)
            );


        document.getElementById(
            category
        ).value = index;

    });


    updateBuild();


    updateSelectedBuild(
        build.Build_Name
    );
}


async function updateSavedBuild() {

    if (!selectedBuildID) {

        alert(
            "Please load a saved build first."
        );

        return;
    }


    const build =
        getCurrentBuild();


    if (
        build.buildName.trim() === ""
    ) {

        alert(
            "Please enter a build name."
        );

        return;
    }


    if (
        !build.cpu ||
        !build.motherboard ||
        !build.gpu ||
        !build.ram ||
        !build.storage ||
        !build.psu ||
        !build.case
    ) {

        alert(
            "Please select all components."
        );

        return;
    }


    if (
        build.cpu.socket !==
        build.motherboard.socket
    ) {

        alert(
            "Cannot update an incompatible build."
        );

        return;
    }


    try {

        const response =
            await fetch(
               "backend/update_build.php",
                {
                    method: "POST",

                    headers: {
                        "Content-Type":
                            "application/json"
                    },

                    body: JSON.stringify({

                        buildID:
                            selectedBuildID,

                        buildName:
                            build.buildName,

                        cpuID:
                            build.cpu.id,

                        motherboardID:
                            build.motherboard.id,

                        gpuID:
                            build.gpu.id,

                        ramID:
                            build.ram.id,

                        storageID:
                            build.storage.id,

                        psuID:
                            build.psu.id,

                        caseID:
                            build.case.id,

                        totalPrice:
                            build.total

                    })
                }
            );


        const result =
            await response.json();


        if (!result.success) {

            alert(
                "Failed to update build: " +
                result.message
            );

            return;
        }


        await loadSavedBuilds();


        updateSelectedBuild(
            build.buildName
        );


        alert(
            "Build updated successfully!"
        );


    } catch (error) {

        console.error(
            "Update build error:",
            error
        );

        alert(
            "An error occurred while updating the build."
        );

    }
}


async function deleteBuild() {

    if (!selectedBuildID) {

        alert(
            "Please load a saved build first."
        );

        return;
    }


    if (
        !confirm(
            "Are you sure you want to delete this build?"
        )
    ) {

        return;
    }


    try {

        const response =
            await fetch(
                "backend/delete_build.php",
                {
                    method: "POST",

                    headers: {
                        "Content-Type":
                            "application/json"
                    },

                    body: JSON.stringify({

                        buildID:
                            selectedBuildID

                    })
                }
            );


        const result =
            await response.json();


        if (!result.success) {

            alert(
                "Failed to delete build: " +
                result.message
            );

            return;
        }


        selectedBuildID = null;


        document.getElementById(
            "buildName"
        ).value = "";


        categories.forEach(category => {

            document.getElementById(
                category
            ).value = "";

        });


        updateSelectedBuild("");


        updateBuild();


        await loadSavedBuilds();


        alert(
            "Build deleted successfully!"
        );


    } catch (error) {

        console.error(
            "Delete build error:",
            error
        );

        alert(
            "An error occurred while deleting the build."
        );

    }
}


function clearBuild() {

    selectedBuildID = null;


    document.getElementById(
        "buildName"
    ).value = "";


    categories.forEach(category => {

        document.getElementById(
            category
        ).value = "";

    });


    updateSelectedBuild("");


    updateBuild();
}


function updateSelectedBuild(name) {

    const buildStatus =
        document.getElementById(
            "buildStatus"
        );


    if (!buildStatus) {
        return;
    }


    if (
        name &&
        name.trim() !== ""
    ) {

        buildStatus.textContent =
            name;

        buildStatus.classList.add(
            "active"
        );

    } else {

        buildStatus.textContent =
            "None";

        buildStatus.classList.remove(
            "active"
        );

    }
}


categories.forEach(category => {

    document.getElementById(category)
        .addEventListener(
            "change",
            updateBuild
        );

});


document.getElementById(
    "saveBtn"
).addEventListener(
    "click",
    saveBuild
);


document.getElementById(
    "updateBtn"
).addEventListener(
    "click",
    updateSavedBuild
);


document.getElementById(
    "deleteBtn"
).addEventListener(
    "click",
    deleteBuild
);


document.getElementById(
    "clearBtn"
).addEventListener(
    "click",
    clearBuild
);


loadComponentData();
loadSavedBuilds();