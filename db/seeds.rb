admin = User.create!(name: 'Esteban', email: 'esteban@example.com', password: 'password', role: :admin)
user = User.create!(name: 'Empleado', email: 'empleado@example.com', password: 'password', role: :user)

JobOffer.create!(
  [
    { title: 'Desarrollador Backend', description: 'Construcción de API.', requirements: 'Ruby on Rails', created_by: admin.id },
    { title: 'Diseñador UI/UX', description: 'Creación de interfaces.', requirements: 'Figma', created_by: admin.id }
  ]
)

