import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="nfc"
export default class extends Controller {
  static targets = [ 'scanMessage', 'textToWrite', 'nfcForm', 'write', 'scan' ]
  static values = {
    task: String
  }

  connect() {
    this.setMessage("Scan the NFC Tag you would like to assign.", 0)
  }

  async scanNewNfc() {
    if ("NDEFReader" in window) {
      this.setMessage("NDEFReader is availiable in browser.", 1);
      try {
        const ndef = new window.NDEFReader();
        await ndef.scan();

        this.setMessage("Scan for NFC started successfully.", 1);
        ndef.onreadingerror = () => {
          this.setMessage("Cannot read data from the NFC tag. Try another one.", 0);
          this.retry();
        };

        ndef.onreading = (event) => {
          const serialNumber = event.serialNumber;
          const url = `${this.nfcFormTarget.action}?serial_number=${serialNumber}`;

          this.nfcFormTarget[2].value = event.serialNumber;
          this.nfcFormTarget[1].value = `${window.location.origin}/tasks/${this.taskValue}`;
          this.setMessage("Scan the NFC was successfully completed.", 1);
          this.writeTarget.classList.remove("d-none");
          this.scanTarget.classList.add("d-none");
        }
      } catch (error) {
        this.setMessage(`Error! Scan failed to start: ${error}.`, 0);
        this.retry();
      }
    } else {
      this.setMessage("No NDEFReader is availiable in browser. Change to Mobile device...", 0);
    }
  }

  async writeNewNfc() {
    const record = { recordType: "url", data: this.nfcFormTarget[1].value }

    if ("NDEFReader" in window) {
      this.setMessage("NDEFReader is availiable in browser.", 1);
      try {
        const ndef = new window.NDEFReader();
        await ndef.write({records: [record]}).then(() => {
          this.setMessage("Writing to NFC was successfully.");
        }).catch(error => {
          this.scanMessageTarget.innerText = error
        });

        ndef.onwritingerror = () => {
          this.setMessage("Cannot write data to the NFC tag. Try another one.", 0);
          this.retry();
        };
      } catch (error) {
        this.setMessage(`Error! Writing failed: ${error}.`, 0);
        this.retry();
      }
    } else {
      this.setMessage("No NDEFReader is availiable in browser. Change to Mobile device...", 0);
      this.retry();
    }
  }

  retry() {
    setTimeout(2)
    this.writeTarget.classList.add("d-none");
    this.scanTarget.classList.remove("d-none");
    this.setMessage("Try again by scanning the NFC Tag.", 0)
  }

  setMessage(message, type) {
    this.scanMessageTarget.innerText = message;
    if (type == 0) {
      this.scanMessageTarget.style.color = "red";
    } else {
      this.scanMessageTarget.style.color = "green";
    }
  }
}
