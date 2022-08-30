import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="nfc"
export default class extends Controller {
  static targets = [ 'scanMessage', 'textToWrite', 'nfcForm' ]
  static values = {
    task: String
  }

  connect() {
    console.log("Hello from NFC Controller.");
  }

  async scanNewNfc() {
    if ("NDEFReader" in window) {
      console.log("NDEFReader is availiable in browser.");
      try {
        const ndef = new window.NDEFReader();
        await ndef.scan();

        console.log("Scan for NFC started successfully.");
        ndef.onreadingerror = () => {
          console.log("Cannot read data from the NFC tag. Try another one.");
        };

        ndef.onreading = (event) => {
          this.nfcFormTarget[2].value = event.serialNumber
          this.nfcFormTarget[1].value = `${window.location.origin}/tasks/${this.taskValue}`
        }
      } catch (error) {
        console.log(`Error! Scan failed to start: ${error}.`);
      }
    } else {
      console.log("No NDEFReader is availiable in browser. Change to Mobile device...");
    }
  }

  async writeNewNfc() {
    const record = { recordType: "url", data: this.nfcFormTarget[1].value }
    await ndef.write({
      records: [record]
    }).then(() => {
      this.scanMessageTarget.innerText = `Value Saved!`
    }).catch(error => {
      this.scanMessageTarget.innerText = error
    });
  }
}
