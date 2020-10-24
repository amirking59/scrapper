const rp = require("request-promise");
const $ = require("cheerio");
const express = require("express");
const fs = require("fs");
const app = express();
app.use(express.json());

var pattern = new RegExp(
  "^(https?:\\/\\/)?" +
    "((([a-z\\d]([a-z\\d-]*[a-z\\d])*)\\.?)+[a-z]{2,}|" +
    "((\\d{1,3}\\.){3}\\d{1,3}))" +
    "(\\:\\d+)?(\\/[-a-z\\d%_.~+]*)*" +
    "(\\?[;&a-z\\d%_.~+=-]*)?" +
    "(\\#[-a-z\\d_]*)?$",
  "i"
);

app.get("/", async (request, response) => {
  scrapText(request.body.url);
});

var scrappedLinks = [];

const scrapText = async (url) => {
  scrappedLinks.push(url);
  var strings = "";
  await rp(url)
    .then(async function (html) {
      strings = strings
        .concat($("p, span, #text", html).text())
        .replace(/(<([^>]+)>)/gi, "")
        .replace(/\s+/g, " ")
        .replace(/[0-9]/g, "")
        .trim();
      fs.appendFile(`text.txt`, strings, function (err) {
        if (err) console.log(`Error ${url}`);
        console.log(`Done ${url}`);
        if ($("a", html) !== undefined) {
          scrapLink($("a", html));
        }
      });
    })
    .catch(function (err) {
      console.error(`Error ${url}`);
    });
};

const scrapLink = async (links) => {
  for (let i = 0; i < links.length; i++) {
    if (pattern.test(links[i].attribs.href)) {
      if (!scrappedLinks.includes(links[i].attribs.href)) {
        scrapText(links[i].attribs.href);
      }
    }
  }
};

app.listen(3000, console.log("App Listening to port 3000"));
