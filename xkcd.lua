-- <km.title>Random XKCD</km.title>
-- <km.version>v1.0</km.version>
-- <km.author>Miguel Vanhove</km.author>
-- <km.author.github>redbug26</km.author.github>
-- <km.desc>Display a random XKCDl</km.desc>

json = require("json")

function get_xkcd_info(url)
    response = km_http.request(url)
    return json.decode(response)
end

xkcd_info = get_xkcd_info("http://xkcd.com/info.0.json")
img_num = xkcd_info.num
img_rand = math.random(1, img_num)

xkcd_rand_info = get_xkcd_info("https://xkcd.com/" .. img_rand .. "/info.0.json")
img_url = xkcd_rand_info.img
title = xkcd_rand_info.safe_title
sub_title = xkcd_rand_info.alt:gsub("%s+", " "):gsub("(.{100})", "%1\n")

body = "<img src=\"" .. img_url .. "\" style=\"width:100%;\">"
body = body .. "<br>"
body = body .. "<a href=\"https://www.xkcd.com/" .. img_rand .. "\">".. title .. "</a><br>"
body = body .. sub_title .. "<br>"
body = body .. "<a href=\"https://www.explainxkcd.com/" .. img_rand .. "\">Explain XKCD wiki</a><br>"

print(body)

window.displayhtml(body)