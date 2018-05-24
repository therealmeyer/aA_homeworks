document.addEventListener("DOMContentLoaded", () => {
  // toggling restaurants

  const toggleLi = (e) => {
    const li = e.target;
    if (li.className === "visited") {
      li.className = "";
    } else {
      li.className = "visited";
    }
  };

  document.querySelectorAll("#restaurants li").forEach((li) => {
    li.addEventListener("click", toggleLi);
  });

  const addToList = (e) => {
    e.preventDefault();

    const input = document.querySelector(".favorite-input");
    const li = input.value;
    input.value = "";

    const newLi = document.createElement("li");
    newLi.textContent = li;

    const list = document.getElementById("sf-places");
    list.appendChild(newLi);
  };

  const listSubmit = document.querySelector(".favorite-submit");
  listSubmit.addEventListener("click", addToList);



  // adding new photos

  const showNewPhotoForm = (e) => {
    const form = document.querySelector(".photo-form-container");
    if (form.className === "photo-form-container") {
      form.className = "photo-form-container hidden";
    } else {
      form.className = "photo-form-container";
    }
  };

  const togglePhotoForm = document.querySelector(".photo-show-button");
  togglePhotoForm.addEventListener("click", showNewPhotoForm);


  const newPhoto = (e) => {
    e.preventDefault();

    const urlInput = document.querySelector(".photo-url-input");
    const url = urlInput.value;
    urlInput.value = "";

    const newImg = document.createElement("img");
    newImg.src = url;

    const newLi = document.createElement("li");
    newLi.appendChild(newImg);

    const dog = document.querySelector(".dog-photos");
    dog.appendChild(newLi);
  };

  const submit = document.querySelector(".photo-url-submit");
  submit.addEventListener("click", newPhoto);


});
