let container = document.querySelector(".container");
container.addEventListener("mousemove", e => {
    // X and Y coordinates
    let x = e.offsetX;
    let y = e.offsetY;
    // apply X and Y values as main background colors
    container.style.backgroundColor = `rgb( ${x}, ${y}, ${x-y} )`;
    // display X and Y coordinate values
    document.getElementById("coordinate").innerHTML = ` X=${x} ; Y=${y} `;
});