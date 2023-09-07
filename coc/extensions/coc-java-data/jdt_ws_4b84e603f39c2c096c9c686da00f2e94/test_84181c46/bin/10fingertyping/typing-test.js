const readline = require('readline');

const TEST_DURATION = 30; // 30 seconds
const WORDS_PER_LINE = 10;
const LINES_TO_DISPLAY = 5;

let lines = [];
let currentIndex = 0;
let totalWordsTyped = 0;
let startTime, endTime;

function generateLines() {
  // Generate random lines of text
  lines = [];
  for (let i = 0; i < LINES_TO_DISPLAY; i++) {
    let line = '';
    for (let j = 0; j < WORDS_PER_LINE; j++) {
      line += generateRandomWord() + ' ';
    }
    lines.push(line.trim());
  }
}

function generateRandomWord() {
  const words = ['apple', 'banana', 'cat', 'dog', 'elephant', 'fish', 'grape', 'hat', 'ice cream', 'jungle'];
  const randomIndex = Math.floor(Math.random() * words.length);
  return words[randomIndex];
}

function displayLines() {
  for (let i = 0; i < LINES_TO_DISPLAY; i++) {
    console.log(lines[i]);
  }
}

function calculateWPM() {
  const timeElapsed = (endTime - startTime) / 1000; // Convert to seconds
  const wordsPerMinute = Math.round((totalWordsTyped / timeElapsed) * 60);
  console.log(`Words per Minute: ${wordsPerMinute}`);
}

function handleInput(input) {
  const currentLine = lines[currentIndex];
  const wordsInCurrentLine = currentLine.split(' ');

  if (input === currentLine) {
    totalWordsTyped += wordsInCurrentLine.length;
    currentIndex++;

    if (currentIndex === lines.length) {
      currentIndex = 0;
      generateLines();
    }

    console.clear();
    displayLines();
  }
}

function startTest() {
  generateLines();
  console.clear();
  displayLines();

  startTime = new Date();

  const timer = setInterval(() => {
    const currentTime = new Date();
    const timeElapsed = (currentTime - startTime) / 1000; // Convert to seconds

    if (timeElapsed >= TEST_DURATION) {
      clearInterval(timer);
      endTime = currentTime;
      calculateWPM();
      console.log('Press Ctrl + C to quit.');
    }
  }, 1000);
}

// Create a readline interface for input
const rl = readline.createInterface({
  input: process.stdin,
  output: process.stdout,
});

// Handle user input
rl.on('line', (input) => {
  handleInput(input);
});

console.log('Welcome to the Typing Test!');
console.log('Type the entire lines displayed below:');
console.log('');

startTest();
