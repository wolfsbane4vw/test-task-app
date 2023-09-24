<!doctype html>
<html lang="et">
<head>
    <meta charset="UTF-8"/>
    <meta name="viewport" content="width=device-width, initial-scale=1.0"/>
    <meta name="csrf-token" content="{{csrf_token()}}">
    <title>{{ $title ?? 'Helmes Test task' }}</title>
    @vite('resources/css/app.css')
</head>
<body>
    <div class="container">
        {{ $slot }}
    </div>
</body>
</html>
