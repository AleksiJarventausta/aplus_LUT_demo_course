describe("Hello button", () => {
  it("should exist", () => {
    browser.url("http://localhost:8082");
    const $button = $("#hello_button");
    expect($button).toExist();
    expect($button.getTagName()).toMatch("button");
  });
  it('should change the paragraph to "Hello World!"', () => {
    browser.url("http://localhost:8082");
    const $paragraph = $("#text_label");
    expect($paragraph.getText()).not.toMatch("Hello World!");

    const $button = $("#hello_button");
    $button.click();
    expect($paragraph.getText()).toMatch("Hello World!");
  });
});
describe("text insertion", () => {
  it("should exist", () => {
    browser.url("http://localhost:8082");
    const $area = $("#text_insert");
    expect($area).toExist();
    expect($area.getTagName()).toMatch("textarea");
  });
  it('should change the paragraph to "Hello World!"', () => {
    browser.url("http://localhost:8082");
    const $area = $("#text_insert");
    const $paragraph = $("#text_label");
    expect($paragraph.getText()).not.toMatch("Hello World!");
    $area.clearValue();
    $area.addValue("Hello World!");
    expect($paragraph.getText()).toMatch("Hello World!");
  });
});
