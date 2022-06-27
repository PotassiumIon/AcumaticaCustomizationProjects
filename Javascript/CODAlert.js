function CODAlert() {
  let CODLabel = document.querySelector("input[id$='CODLabel']");

  console.log("CODAlert ran");
  console.log(CODLabel);
  console.log(`Value: ${CODLabel.value}`);

  if (CODLabel) {
    setInterval(() => {
      if (
        CODLabel.getAttribute("style") ==
        "font-size: 24px; text-align: center; background-color: yellow !important;"
      ) {
        CODLabel.style =
          "font-size: 24px; text-align: center; background-color: white !important;";
      } else {
        CODLabel.style =
          "font-size: 24px; text-align: center; background-color: yellow !important;";
      }
    }, 1000);
  }

}

const valueCheckInterval = setInterval(() => {
  if (CODLabel.value) {
    window.alert("THIS IS A COD CUSTOMER");
    clearInterval(valueCheckInterval);
  }
}, 1000);