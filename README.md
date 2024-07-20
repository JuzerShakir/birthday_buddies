<div align="center">
  <img src="app/assets/images/logo.png" width="128" />
  <h2>Birthday Buddies</h2>
  <p>Sending birthday wishes the moment they matter.</p>
</div>

<div align="center">

  <!-- RUBY -->
  <img src="https://img.shields.io/badge/Ruby_3.3.1-CC342D?style=for-the-badge&logo=ruby&logoColor=white">

  <!-- RAILS -->
  <img src="https://img.shields.io/badge/Rails_7.1.3.4-CC0000?style=for-the-badge&logo=ruby-on-rails&logoColor=white">

  <!-- SQLite -->
  <img src="https://img.shields.io/badge/sqlite-%2307405e.svg?style=for-the-badge&logo=sqlite&logoColor=white">

  <!-- TailwindCSS -->
  <img src="https://img.shields.io/badge/tailwindcss-%2338B2AC.svg?style=for-the-badge&logo=tailwind-css&logoColor=white">

 <!-- MORE BADGES visit https://github.com/Ileriayo/markdown-badges -->

</div>

## 🧐 Motivation

We all have loved ones with birthdays scattered throughout the year.

Busy lives can make it easy to forget important dates, leading to missed birthday wishes and potential hurt feelings.

Birthday Buddies is your personal birthday manager, ensuring you never miss a loved one's special day again.

### Benefits

- ⭐ **Effortless Reminders**: The app automatically reminds you of upcoming birthdays, taking the mental burden of remembering off your shoulders.
- ⭐ **Meaningful Connections**: Sending timely birthday wishes strengthens relationships with friends and family, showing you care.
- ⭐ **Peace of Mind**: Birthday Buddies eliminates the guilt and stress of forgetting someone's birthday.

## 🐦‍🔥 Production

This application is hosted in the production. You can check it out here: [Birthday Buddies](https://birthday-threads.fly.dev/)

## 👩‍💻 Development Setup

Open your terminal and clone this repo into a directory of your choice:

```
git@github.com:JuzerShakir/birthday-buddies.git
```

Opening the cloned repository

```
cd birthday-buddies && code .
```

> [!Important]
> Before moving forward make sure **you have Ruby 3.3.1 version installed** in your system. [Or Download from here](https://gorails.com/setup)

Install all the dependencies

```
bundle install
```

### Create database and tables

```
rails db:migrate
```

### Setting up an Email

In order to test emails in development environment you need to install `mailcatcher` gem first.

```
gem install mailcatcher
```

Now to run the mailcatcher:

```
mailcatcher
```

This will output couple of URLs where it will listen for emails. You can visit anyone of the links to check if the emails.

Add mailer credentials to send email to the users:

```bash
EDITOR="code --wait" rails credentials:edit
```

add credentials in this format:

```yml
mailer:
  email: youremail@gmail.com
  password: your-app-password
```

You will need to generate an app password by visiting to 'App Password' in your google settings and paste it here.

---

<br>

<div align="center">
  <!-- BUY ME COFFEE -->
  <a href="https://www.buymeacoffee.com/juzershakir"> <img src="https://cdn.buymeacoffee.com/buttons/v2/default-yellow.png" height="50" width="210" alt="juzershakir" /></a>
</div>

## 💡 Contributing

If you have problems, please create a [GitHub Issue](https://github.com/JuzerShakir/birthday-buddies/issues).

Take a look at the [Contributing](CONTRIBUTING.md) document for
instructions on setting up the repo on your machine, understanding the codebase,
and creating a good pull request.

Thank you, contributors!

## 💪 Challenges I faced

- Designing UI. (theme, font, navigation flow, responsive layout, etc).
- Show & open dialog of the right birthday buddy.
- Calculating the right hijri dates with the `hijri` gem as it shows previous date.
- Calculating next gregorian birthday & hijri birthday to set reminders.
- Using the Solid Queue for background jobs. ([Issue](https://github.com/rails/solid_queue/issues/253))
- Sending birthday email reminders to the user exactly on midnight regardless of which time zones they are from.

## Versioning

Birthday Buddies follows Semantic Versioning 2.0 as defined at https://semver.org.

## License

This code is free to use under the terms of the MIT license.

---
