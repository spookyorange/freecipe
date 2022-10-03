import {Application} from "@hotwired/stimulus"

/* TODO: Flashes should die or get hidden class after the animation finishes */

const application = Application.start()

// Configure Stimulus development experience
application.debug = false
window.Stimulus   = application

export { application }
