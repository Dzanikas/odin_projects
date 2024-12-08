function getRandomInt() {
    const minCeiled = Math.ceil(0); // Hardcoded min = 0
    const maxFloored = Math.floor(2); // Hardcoded max = 2
    return Math.floor(Math.random() * (maxFloored - minCeiled + 1) + minCeiled);
}

function getComputerHand(x) {
    if (x === 0) return "rock";
    if (x === 1) return "paper";
    if (x === 2) return "scissors";
    return "unknown";
}

function getHumanHand() {
    let humanHand = prompt("Choose your hand: rock, paper, or scissors").toLowerCase();
    while (!["rock", "paper", "scissors"].includes(humanHand)) {
        humanHand = prompt("Invalid choice! Please choose rock, paper, or scissors").toLowerCase();
    }
    return humanHand;
}

function playRound(computerSelection, humanSelection) {
    if (computerSelection === humanSelection) {
        return "draw";
    } else if (
        (computerSelection === "rock" && humanSelection === "scissors") ||
        (computerSelection === "paper" && humanSelection === "rock") ||
        (computerSelection === "scissors" && humanSelection === "paper")
    ) {
        return "computer";
    } else {
        return "human";
    }
}

function playGame(rounds) {
    let computerScore = 0;
    let humanScore = 0;

    for (let i = 0; i < rounds; i++) {
        const computerHand = getComputerHand(getRandomInt());
        const humanHand = getHumanHand();

        console.log(`Round ${i + 1}`);
        console.log(`Computer chose: ${computerHand}`);
        console.log(`Human chose: ${humanHand}`);

        const winner = playRound(computerHand, humanHand);

        if (winner === "computer") {
            computerScore++;
            console.log("Computer wins this round!");
        } else if (winner === "human") {
            humanScore++;
            console.log("Human wins this round!");
        } else {
            console.log("It's a draw!");
        }

        console.log(`Score after round ${i + 1}: Computer: ${computerScore}, Human: ${humanScore}`);
    }

    // Determine the final winner
    if (computerScore > humanScore) {
        console.log("Computer wins the game!");
    } else if (humanScore > computerScore) {
        console.log("Human wins the game!");
    } else {
        console.log("The game is a draw!");
    }
}

// Start the game
const numberOfRounds = parseInt(prompt("Enter the number of rounds to play: "), 10);
if (!isNaN(numberOfRounds) && numberOfRounds > 0) {
    playGame(numberOfRounds);
} else {
    console.log("Invalid number of rounds. Please refresh and try again.");
}
