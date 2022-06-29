(() => {
  console.log("handleNoteTimeStamp");

  const interval = setInterval(() => {
    const noteTextArea = document.querySelector(
      "textarea[id='ctl00_usrCaption_tlbDataView_ib_txt']"
    );
    const popUpTextArea = document.querySelector(
      "textarea[id='ctl00_usrCaption_tlbDataView_ib_txtP']"
    );

    if (noteTextArea && popUpTextArea) {
      const btnCont = document.querySelector(
        "div[id='ctl00_usrCaption_tlbDataView_ib_btnCont'][class='buttons-cont']"
      );

      if (btnCont) {
        const button = document.createElement("button");
        button.type = "button";
        button.className = "Button MessageButton";
        button.innerHTML = "Stamp";
        button.onclick = () => {
          let noteOnly =
            document.getElementsByClassName("note-only").length != 0;

          let date = new Date();
          if (noteOnly) {
            let note = document.getElementById(
              "ctl00_usrCaption_tlbDataView_ib_txt"
            );
            if (note && note.value) note.value += "\n";
            note.value += `${date}\n`;
            note.value += "Name: \n";
            note.value += "Note: \n";
          } else {
            let popUpNotes = document.getElementById(
              "ctl00_usrCaption_tlbDataView_ib_txtP"
            );
            if (popUpNotes && popUpNotes.value) popUpNotes.value += "\n";
            popUpNotes.value += `${date}\n`;
            popUpNotes.value += "Name: \n";
            popUpNotes.value += "Note: \n";
          }
        };
        btnCont.append(button);

        clearInterval(interval);
      }
    }
  }, 1000);
})();