

describe('Jungle', () => {
  beforeEach(() => {
    cy.visit('/')
  })

  it('visits the home page on load', () => {

  });

  it("There is products on the page", () => {
    cy.get(".products article").should("be.visible");
  });
})