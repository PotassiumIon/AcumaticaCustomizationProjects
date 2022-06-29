(() => {
  console.log("handle COD");
  const interval = setInterval(() => {
    const CODLabel = document.querySelector(
      "input[ref='elemText'][id='ctl00_phF_BAccount_t0_CODLabel']"
    );

    if (CODLabel) {
      if (CODLabel.value == "This Customer is COD")
        alert("THIS CUSTOMER IS COD");

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
      clearInterval(interval);
    }
  }, 1000);
})();
