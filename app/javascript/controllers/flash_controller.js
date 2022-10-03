import {Controller} from "@hotwired/stimulus";

export default class extends Controller {
  static targets = ["itself"];

  connect() {
    const killIt = () => {
      this.itselfTarget.parentNode.innerHTML = ""
    }
    setTimeout(killIt, 3000);
  }
}
