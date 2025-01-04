#!/bin/sh

wget -c https://gist.githubusercontent.com/straker/ff00b4b49669ad3dec890306d348adc4/raw/315d16d17bca6920cd1ae9192dca647ccb3e0d5d/snake.html
wget -c https://gist.githubusercontent.com/atrakic/29125829ee6f15f9c613e358a23aae3b/raw/a54a0d874ea87ef07ac5b76d032868a3a702c4b6/pong.html
wget -c https://gist.githubusercontent.com/straker/3c98304f8a6a9174efd8292800891ea1/raw/e9b66fcd426978276b19318b1c5df5c4270220e3/tetris.html
wget -c https://gist.githubusercontent.com/straker/98a2aed6a7686d26c04810f08bfaf66b/raw/b719c921ab8eec8cf255734f8cf43f12fddfb098/breakout.html
wget -c https://gist.githubusercontent.com/straker/82a4368849cbd441b05bd6a044f2b2d3/raw/4515c66f6b5d98b1e7a10a87632957d7c40a559c/frogger.html
wget -c https://gist.githubusercontent.com/straker/afc4e2a30b6df772a5f9f6ef01751d41/raw/3759888bb43036975f32e5c034162c1bed0b4746/missile-command.html
wget -c https://gist.githubusercontent.com/straker/b96a4a68bd6d79cf75a833d98a2b654f/raw/8b5212708d8993dbc79e36951d0ead27a09f3485/doodle-jump.html
wget -c https://gist.githubusercontent.com/straker/2fddb507d4bb6bec54ea2fdb022d020c/raw/a10532dce3d1590b8e3c494648b9978c5d724bf8/sokoban.html
wget -c https://gist.githubusercontent.com/straker/769fb461e066147ea16ac2cb9463beae/raw/69c6ac1e80d48983c26a2135b50489850d7ca175/bomberman.html
wget -c https://gist.githubusercontent.com/straker/df855f22e57576c80d6126aa5609654e/raw/7605743e3ce9ea89e5fd48ee972e5f79e244feca/block-dude.html

cat <<EOF > index.html
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Arcade Games</title>
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
    <style>
        body {
            background-color: #121212;
            color: #ffffff;
            text-align: center;
        }
        .list-group-item {
            background-color: #1e1e1e;
            border: none;
            text-align: center;
        }
        .list-group-item a {
            color: #ffffff;
            text-decoration: none;
        }
        .list-group-item a:hover {
            color: #00bcd4;
        }
    </style>
</head>
<body>
    <div class="container">
        <h1 class="my-4">Html arcade games</h1>
        <ul class="list-group">
EOF

for file in *.html; do
    if [ "$file" != "index.html" ]; then
        echo "            <li class=\"list-group-item\"><a href=\"$file\">$(basename "$file" .html)</a></li>" >> index.html
    fi
done

cat <<EOF >> index.html
        </ul>
    </div>
    <footer class="text-center my-4">
        <p>&copy; $(date +%Y) <a href="https://github.com/atrakic/html-arcade">Source code</a></p>
    </footer>
    <script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.5.4/dist/umd/popper.min.js"></script>
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
</body>
</html>
EOF
