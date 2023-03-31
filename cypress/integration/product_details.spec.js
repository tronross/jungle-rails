describe('Jungle product view', () => {
  beforeEach(() => {
    cy.visit('/')
  })

  it('visits the home page on load', () => {
    cy.get('.navbar-brand').should('be.visible');
  });

  it('loads an individual product page when product is selected', () => {
    cy.get('[alt="Scented Blade"]').click()
    cy.get('p').should('have.text', '\n    The Scented Blade is an extremely rare, tall plant and can be found mostly in savannas. It blooms once a year, for 2 weeks.© 2021 Jungle, Inc')
  });
})