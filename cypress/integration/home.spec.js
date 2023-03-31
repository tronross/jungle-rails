

describe('Jungle', () => {
  beforeEach(() => {
    cy.visit('/')
  })

  it('visits the home page on load', () => {
    cy.get(".navbar-brand").should("be.visible");
  });

  it("There are products on the page", () => {
    cy.get(".products article").should("be.visible");
  });
})