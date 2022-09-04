const defaultTheme = require('tailwindcss/defaultTheme')

module.exports = {
  content: [
    './public/*.html',
    './app/helpers/**/*.rb',
    './app/javascript/**/*.js',
    './app/views/**/*.{erb,haml,html,slim}'
  ],
  theme: {
    extend: {
      fontFamily: {
        sans: ['Inter var', ...defaultTheme.fontFamily.sans],
      },
      keyframes: {
        initiateObjectThenKillOpacity: {
          '0%': {scale: 1},
          '50%': {opacity: 1, transform: 'scale(1.05)'},
          '100%': {opacity: 0, transform: 'scale(0.85)'},
        }
      },
      animation: {
        initiateObjectThenKillOpacity: 'initiateObjectThenKillOpacity 2s ease-in-out forwards',
      },
    },
  },
  plugins: [
    require('@tailwindcss/forms'),
    require('@tailwindcss/aspect-ratio'),
    require('@tailwindcss/typography'),
  ]
}
