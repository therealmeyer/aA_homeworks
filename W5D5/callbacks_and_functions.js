//Timeout
window.setTimeout(function () {
  alert('HAMMERTIME')
}, 5000);

//Timeout plus closure
function hammertime (time) {
  window.setTimeout(function () {
    alert(`${time} is hammertime!`);
  });
}

// I/O
const readline = require('readline');

const reader = readline.createInterface({
  input: process.stdin,
  output: process.stdout
});

function teaAndBiscuits () {
  reader.question('Would you like some tea?', (res1) => {
    console.log(`You replied ${res1}.`);
    reader.question('Would you like some biscuits?', (res2) => {
      console.log(`You replied ${res2}.`);

      const firstRes = (res1 === 'yes') ? 'do' : 'don\'t';
      const secondRes = (res2 === 'yes') ? 'do' : 'don\'t';

      console.log(`So you ${firstRes} want tea and you ${secondRes} want biscuits.`);
      reader.close();
    });
  });
}

// Calling functions
function Cat () {
  this.name = 'Markov';
  this.age = 3;
}

function Dog () {
  this.name = 'Noodles';
  this.age = 4;
}

Dog.prototype.chase = function (cat) {
  console.log(`My name is ${this.name} and I'm chasing ${cat.name}! Woof!`)
};

const Markov = new Cat ();
const Noodles = new Dog ();


Noodles.chase(Markov);
Noodles.chase.call(Markov, Noodles);
Noodles.chase.apply(Markov, [Noodles]);
