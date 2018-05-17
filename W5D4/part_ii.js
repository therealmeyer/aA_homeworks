// Phase 1
function titleize(names, callback) {
  let titleized = names.map(name => `Mx. ${name} Jingleheimer Schmidt`);
  callback(titleized);
}

titleize(["Mary", "Brian", "Leo"], (names) => {
  names.forEach(name => console.log(name));
});
// Phase 2
function Elephant(name, height, tricks) {
  this.name = name;
  this.height = height;
  this.tricks = tricks
}

Elephant.prototype.trumpet = function () {
  console.log(`${this.name} the elephant goes 'phrRRRRRRRRRRR!!!!!!!'`);
};

Elephant.prototype.grow = function () {
  this.height = this.height + 12;
  // console.log(this.height)
}
Elephant.prototype.addTrick = function (trick) {
  this.tricks.push(trick)
  // console.log(this.tricks)
}

Elephant.prototype.play = function () {
  var rand = this.tricks[Math.floor(Math.random() * this.tricks.length)];
  console.log(`${this.name} is ${rand}!`)
}

elephant = new Elephant("Earl", 100, ["painting pictures", "singing songs"]);
elephant.trumpet();
elephant.grow();
elephant.play();
elephant.addTrick("eating eggplants")

// Phase 3

let ellie = new Elephant("Ellie", 185, ["giving human friends a ride", "playing hide and seek"]);
let charlie = new Elephant("Charlie", 200, ["painting pictures", "spraying water for a slip and slide"]);
let kate = new Elephant("Kate", 234, ["writing letters", "stealing peanuts"]);
let micah = new Elephant("Micah", 143, ["trotting", "playing tic tac toe", "doing elephant ballet"]);

let herd = [ellie, charlie, kate, micah];

Elephant.paradeHelper = function (elephant) {
  console.log(`${elephant.name} is trotting by!`);
}

function dinnerBreakfast() {
  let order = "I'd like scrambled eggs and bacon please";
  console.log(order);
  return function (food) {
    order = `${order.slice(0, order.length - 7)} and ${food} please`;
    console.log(order);
  };
}
