function component() {
  var element = document.createElement('div');

  // Lodash, now inported by this script
  element.innerHTML = _.join(['Hello', 'webpack'], ' ');

  return element;
}

document.body.appendChild(component());
