import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="nfc"
export default class extends Controller {
  static targets = [ 'scanMessage', 'textToWrite', 'nfcForm' ]
  static values = {
    task: String
  }

  connect() {
  }

  async scanNewNfc() {
    if ("NDEFReader" in window) {
      this.scanMessageTarget.innerText = "NDEFReader is availiable in browser.";
      try {
        const ndef = new window.NDEFReader();
        await ndef.scan();

        this.scanMessageTarget.innerText = "Scan for NFC started successfully.";
        ndef.onreadingerror = () => {
          this.scanMessageTarget.innerText = "Cannot read data from the NFC tag. Try another one.";
        };

        ndef.onreading = (event) => {
          this.nfcFormTarget[2].value = event.serialNumber
          this.nfcFormTarget[1].value = `${window.location.origin}/tasks/${this.taskValue}`
        }
      } catch (error) {
        this.scanMessageTarget.innerText = `Error! Scan failed to start: ${error}.`;
      }
    } else {
      this.scanMessageTarget.innerText = "No NDEFReader is availiable in browser. Change to Mobile device...";
    }
  }

  async writeNewNfc() {
    const record = { recordType: "url", data: this.nfcFormTarget[1].value }

    if ("NDEFReader" in window) {
      this.scanMessageTarget.innerText = "NDEFReader is availiable in browser.";
      try {
        const ndef = new window.NDEFReader();
        await ndef.write({records: [record]}).then(() => {
          this.scanMessageTarget.innerText = "Writing to NFC was successfully.";
        }).catch(error => {
          this.scanMessageTarget.innerText = error
        });

        ndef.onwritingerror = () => {
          this.scanMessageTarget.innerText = "Cannot write data to the NFC tag. Try another one.";
        };
      } catch (error) {
        this.scanMessageTarget.innerText = `Error! Writing failed: ${error}.`;
      }
    } else {
      this.scanMessageTarget.innerText = "No NDEFReader is availiable in browser. Change to Mobile device...";
    }
  }
}
