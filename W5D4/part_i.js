function mysteryScoping1() {
  var x = 'out of block';
  if (true) {
    var x = 'in block';
    console.log(x);
  }
  console.log(x);
} // => in block, in block

function mysteryScoping2() {
  const x = 'out of block';
  if (true) {
    const x = 'in block';
    console.log(x);
  }
  console.log(x);
} // => in block, out of block

function mysteryScoping3() {
  const x = 'out of block';
  if (true) {
    var x = 'in block';
    console.log(x);
  }
  console.log(x);
} // SyntaxError: Identifier 'x' has already been declared

function mysteryScoping4() {
  let x = 'out of block';
  if (true) {
    let x = 'in block';
    console.log(x);
  }
  console.log(x);
} // => in block, out of block

function mysteryScoping5() {
  let x = 'out of block';
  if (true) {
    let x = 'in block';
    console.log(x);
  }
  let x = 'out of block again';
  console.log(x);
} // SyntaxError: Identifier 'x' has already been declared

function madlib(verb, adj, noun) {
  return `We shall ${verb.toUpperCase()} the ${adj.toUpperCase()} ${noun.toUpperCase()}`
}

function isSubstring(searchString, subString) {
  if (searchString.includes(subString)) {
    return true;
  }
  return false;
}

function fizzBuzz(array) {
  var fizz_buzz = [];
  for (let i=0; i < array.length; i++) {
    if (array[i] % 3 === 0 || array[i] % 5 === 0) {
      fizz_buzz.push(array[i]);
    }
  }
  return fizz_buzz;
}

function isPrime(num) {
  if (num < 2) {
    return true;
  }
  for (let i = 2; i < num; i++ )
    if (num % i === 0) {
      return false;
    }
  return true;
}

function sumOfNPrimes(num) {
  let sum = 0;
  let count_primes = 0;
  let n = 2;
  while (count_primes < num) {
    if (isPrime(n)) {
      sum += n;
      count_primes++;
    }
    n++;
  }
  return sum;
}
