const container = document.querySelector(".container")
const btn = document.querySelector("button")

btn.addEventListener("click", () => {
    const size = parseInt(prompt("Enter the size of the box"));
    container.replaceChildren();

    for (let i = 0; i<(size**2); i++) {
        const grid = document.createElement("div");
        grid.classList.add("grid");
        grid.style.flex = `1 1 ${640/size}px`;
        grid.addEventListener("mouseenter", () => {grid.style.backgroundColor = "blue";});
        container.appendChild(grid);
};
});



