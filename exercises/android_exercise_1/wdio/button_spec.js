var wdio = require("webdriverio");
var assert = require("assert");

async function getElementById(id, driver) {
  const appPackage = await driver.getCurrentPackage();
  const textviewSelector =
    'new UiSelector().resourceId("' + appPackage + ":id/" + id + '")';
  return $("android=" + textviewSelector);
}

describe("Hello button", () => {
  it("should change the text to 'Hello World!'", async () => {
    const paragraph = await getElementById("txtResult", driver);
    let actualText = await paragraph.getText();

    let expectedText = "Hello World!";
    assert.notStrictEqual(
      actualText,
      expectedText,
      "Text should be something else before the button is clicked"
    ); // compare expected value and actula value
    let helloButton = await getElementById("btnSubmit", driver);
    await helloButton.click();
    actualText = await paragraph.getText();
    assert.strictEqual(actualText, expectedText);
  });
});
