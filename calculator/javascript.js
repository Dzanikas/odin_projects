function addition (a, b) {
    result = a + b;
    return result
};

function subtraction (a, b) {
    result = a - b;
    return result
};

function multiplication (a, b) {
    result = a * b;
    return result
};

function division (a, b) {
    result = a / b;
    return result
};

function operate (num_1, num_2, operator) {
    if (operator === "+") {
        addition(num_1, num_2);
    } else if (operator === "-") {
        subtraction(num_1, num_2);
    } else if (operator === "*") {
        multiplication(num_1, num_2);
    } else if (operator === "/") {
        division(num_1, num_2);
    };
    return result
};

let display = document.querySelector(".display")
let btn_clear = document.querySelector("#clear")
let btn_sign = document.querySelector("#sign")
let btn_percent = document.querySelector("#percent")
let btn_equal = document.querySelector("#equal")
let btn_plus = document.querySelector("#plus")
let btn_minus = document.querySelector("#minus")
let btn_multiply = document.querySelector("#multiply")
let btn_divide = document.querySelector("#divide")
let btn_one = document.querySelector("#one")
let btn_two = document.querySelector("#two")
let btn_three = document.querySelector("#three")
let btn_four = document.querySelector("#four")
let btn_five = document.querySelector("#five")
let btn_six = document.querySelector("#six")
let btn_seven = document.querySelector("#seven")
let btn_eight = document.querySelector("#eight")
let btn_nine = document.querySelector("#nine")

let num_1 = 0;
let num_2 = 0;
let result = 0;
let operator = "";
let calc = [];

btn_equal.disabled = true;

btn_clear.addEventListener("click", () => {
    display.replaceChildren();
    btn_equal.disabled = true;
});

btn_plus.addEventListener("click", () => {
    let operator = "+";
    const content = display.textContent.trim();
    calc.push(content);
    display.replaceChildren(); // <-- code that begins input of the second element in the array (here or on an operand)
    btn_equal.disabled = true;
    return operator
    // <-- code that performs the operation if there are already 2 elements in the array
});

btn_equal.addEventListener("click", () => { // <-- either function operate or function that converts the array and calls operate
    num_1 = parseFloat(calc[1]);
    num_2 = parseFloat(calc[2]);
    operate(num_1, num_2, operator);
    num_1 = result
    display.replaceChildren();
    let append = document.createElement("span");
    append.textContent = result;
    display.appendChild(append);
});

btn_one.addEventListener("click", () => {
    let append = document.createElement("span");
    append.textContent = "1";
    display.appendChild(append);
    btn_equal.disabled = false;
});