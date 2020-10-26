const rp = require("request-promise");
const $ = require("cheerio");
const express = require("express");
const app = express();
const createCsvWriter = require("csv-writer").createObjectCsvWriter;
app.use(express.json());

// Checking if link is valid
var pattern = new RegExp(
  "^(https?:\\/\\/)?" +
    "((([a-z\\d]([a-z\\d-]*[a-z\\d])*)\\.?)+[a-z]{2,}|" +
    "((\\d{1,3}\\.){3}\\d{1,3}))" +
    "(\\:\\d+)?(\\/[-a-z\\d%_.~+]*)*" +
    "(\\?[;&a-z\\d%_.~+=-]*)?" +
    "(\\#[-a-z\\d_]*)?$",
  "i"
);

// Variables
var baseUrl = "";
var scrappedLinks = [];
var scrappedStrings = [];

// Start point
app.get("/", async (request, response) => {
  scrapText(request.body.url);
  baseUrl = request.body.url;
});

// Save CSV file every 1 minutes
setInterval(() => {
  var date = new Date().getTime();
  const csvWriter = createCsvWriter({
    path: `out/${date}.csv`,
    header: [{ id: "text", title: "Text" }],
  });
  csvWriter.writeRecords(scrappedStrings).then(() => {
    console.log("File saved!");
    scrappedStrings = [];
  });
}, 60000);

const scrapText = async (url) => {
  scrappedLinks.push(url);
  var strings = "";
  await rp(url)
    .then(async function (html) {
      strings = strings
        .concat($("p, span, #text", html).text())
        .replace(/(<([^>]+)>)/gi, "")
        .replace(/\s+/g, " ")
        .trim();
      strings.split(".").forEach((string) => {
        scrappedStrings.push({
          text: string,
        });
      });
      console.log(`Done ${url}`);
      await scrapLink($("a", html));
    })
    .catch(function (err) {
      console.error(`Error ${url}`);
    });
};

const scrapLink = async (links) => {
  for (let i = 0; i < links.length; i++) {
    if (pattern.test(links[i].attribs.href)) {
      if (!scrappedLinks.includes(links[i].attribs.href)) {
        if (links[i].attribs.href !== undefined) {
          if (links[i].attribs.href.includes(baseUrl)) {
            await scrapText(links[i].attribs.href);
          } else {
            scrappedLinks.push(links[i].attribs.href);
          }
        }
      }
    }
  }
};

app.listen(3000, console.log("Scrapper is runnig on port 3000"));
