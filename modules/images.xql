xquery version "3.0";


declare option exist:serialize "method=html media-type=text/html";


declare function local:myMonth($month)
{
    if ($month = '01') then
        "Января"
    else if ($month = '02') then
        "Февраля"
    else if ($month = '03') then
        "Марта"
    else if ($month = '04') then
        "Апреля"
    else if ($month = '05') then
        "Мая"
    else if ($month = '06') then
        "Июня"
    else if ($month = '07') then
        "Июля"
    else if ($month = '08') then
        "Августа"
    else if ($month = '09') then
        "Сентября"
    else if ($month = '10') then
        "Октября"
    else if ($month = '11') then
        "Ноября"
    else
        "Декабря"
};


<html>
    
    <body>
    <hr />
    <ul class="list-group">
    {
        for $image in /images/image
        let $d := $image/pubdate,
            $y := substring($d, 1, 4),
            $m := substring($d, 6, 2),
            $day := substring($d, 9, 2),
            $date := concat($day, ".", local:myMonth($m), ".", $y)
        return
                <li class="list-group-item list-group-item-success">
                    <a>{ $image/title/text() }</a>
                    <a>{ $date }</a>
                    <a> - { $image/description }</a>
                </li>
    }
    </ul>
    <hr />
    </body>
</html>
