const defaultTheme = require("tailwindcss/defaultTheme");

module.exports = {
	content: [
		"./public/*.html",
		"./app/helpers/**/*.rb",
		"./app/javascript/**/*.js",
		"./app/views/**/*.{erb,haml,html,slim}",
		"./app/assets/stylesheets/**/*.css",
	],

	theme: {
		fontFamily: {
			sans: ["Nunito Sans", ...defaultTheme.fontFamily.sans],
		},
		extend: {
			colors: {
				// Yellow
				primary: {
					50: "#fefce8",
					100: "#fef9c3",
					200: "#fef08a",
					300: "#fde047",
					400: "#facc15",
					500: "#eab308",
					600: "#ca8a04",
					700: "#a16207",
					800: "#854d0e",
					900: "#713f12",
					950: "#422006",
				},
				// Orange
				secondary: {
					50: "#fff7ed",
					100: "#ffedd5",
					200: "#fed7aa",
					300: "#fdba74",
					400: "#fb923c",
					500: "#f97316",
					600: "#ea580c",
					700: "#c2410c",
					800: "#9a3412",
					900: "#7c2d12",
					950: "#431407",
				},
			},
		},
	},

	plugins: [
		require("@tailwindcss/forms"),
		require("@tailwindcss/typography"),
		require("@tailwindcss/container-queries"),
	],
};
