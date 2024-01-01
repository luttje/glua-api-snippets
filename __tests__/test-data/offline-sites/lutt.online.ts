/**
 * Source of https://lutt.online for stable testing
 */
export const html = /* html */ `

<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta name="viewport"
          content="width=device-width, initial-scale=1.0">
    <meta http-equiv="X-UA-Compatible"
          content="ie=edge">
    <meta name="abuseipdb-verification"
          content="QG5XcIPz" />
    <meta name="description"
          content="In my free time I develop web applications and game-stuff for friends.">
    <link rel="shortcut icon"
          href="favicon.ico"
          type="image/x-icon">

    <title>Lutt.online</title>

    <style>
        html {
            height: 100%;
            min-width: 320px;
        }

        body {
            padding: 0;
            margin: 0;
            min-height: 100%;

            display: flex;
            justify-content: center;
            flex-direction: column;

            background: url('./images/backgrounds/canada-wash.jpg');
            background-size: cover;

            line-height: 1.5em;
            font-family: 'Roboto', sans-serif;
            font-size: 1em;
            font-weight: bold;
            color: #F2F2F2;
            text-align: center;
            text-shadow:
                -1px -1px 0 #333333,
                1px -1px 0 #333333,
                -1px 1px 0 #333333,
                1px 1px 0 #333333;
            letter-spacing: 0.15em;
        }

        .wrapper {
            max-width: 960px;
            margin: 0 auto;
        }

        .pos-abs {
            position: absolute;
            max-width: 100%;
            padding: 1em;
        }

        .pos-abs.tr {
            top: 0;
            right: 0;
        }

        .pos-abs.br {
            bottom: 0;
            right: 0;
            text-align: right;
        }

        @media screen and (max-width: 550px) {
            h1 {
                box-sizing: border-box;
                padding: 1em;
            }

            h1 img {
                width: 100%;
                height: auto;
            }
        }
    </style>
</head>

<body>
    <div class="wrapper">
        <div>
            <h1><img src="images/logos/logo375-outlined.png"
                     width="441"
                     height="200"
                     alt="Lutt.online logo"
                     title="Lutt.online"></h1>
            <span>Hello World!</span>
        </div>
    </div>

    <div class="pos-abs tr">
        <a href="https://github.com/luttje/"
           rel="noreferrer"
           target="_blank">
            <img src="images/logos/github-mark.png"
                 width="32"
                 height="32"
                 alt="GitHub Logo"
                 title="I'm on GitHub!">
        </a>
    </div>

    <div class="pos-abs br">
        Currently I&#39m not looking for new projects.<br> Have a nice day!
    </div>

    <link href="https://fonts.googleapis.com/css?family=Roboto&display=swap"
          rel="stylesheet">
</body>
</html>`;
