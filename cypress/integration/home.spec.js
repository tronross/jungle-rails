describe('Home page', () => {
  beforeEach(() => {
    cy.visit('/')
  })

  it('Visits the home page on load', () => {
    cy.get('.navbar-brand').should('be.visible');
  });

  it('There are products on the page', () => {
    cy.get('.products article').should('be.visible');
  });

  it('There are 2 products on the page', () => {
    cy.get('.products article').should('have.length', 2);
  });
})