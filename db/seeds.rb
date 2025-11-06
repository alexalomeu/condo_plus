puts "🌇 Criando imobiliárias de exemplo..."

RealEstate.destroy_all if defined?(RealEstate)

# -------------------------------
# Imobiliárias
# ------------------------------- 
real_estate1 = RealEstate.create!(
  name: "Imobiliária Prime",
  cnpj: "12.345.678/0001-90",
  email: "contato@prime.com.br",
  phone: "(11) 98765-4321",
  address: "Av. Paulista, 1000, São Paulo, SP, 01310-100",
  responsible_name: "Carlos Silva",
  responsible_phone: "(11) 91234-5678",
  responsible_email: "carlos.silva@prime.com.br"
)

real_estate2 = RealEstate.create!(
  name: "Imobiliária Global",
  cnpj: "98.765.432/0001-55",
  email: "contato@global.com.br",
  phone: "(21) 91234-5678",
  address: "Rua das Laranjeiras, 500, Rio de Janeiro, RJ, 22240-003",
  responsible_name: "Ana Pereira",
  responsible_phone: "(21) 99876-5432",
  responsible_email: "ana.pereira@global.com.br"
)

# -------------------------------
# Condomínios
# -------------------------------
condo1 = Condominium.create!(name: "Residencial Jardim das Flores", real_estate: real_estate1)
condo2 = Condominium.create!(name: "Edifício Solar", real_estate: real_estate1)
condo3 = Condominium.create!(name: "Condomínio Vista Verde", real_estate: real_estate1)
condo4 = Condominium.create!(name: "Condomínio Alfa", real_estate: real_estate2)
condo5 = Condominium.create!(name: "Residencial Beta", real_estate: real_estate2)

# -------------------------------
# Receitas / Revenues
# -------------------------------
Revenue.create!([
  { real_estate: real_estate1, condominium: condo1, unit: "101", negotiated_value: 350_000, monetization: 5_000, date: "2025-01-15" },
  { real_estate: real_estate1, condominium: condo2, unit: "202", negotiated_value: 280_000, monetization: 3_500, date: "2025-01-20" },
  { real_estate: real_estate1, condominium: condo1, unit: "305", negotiated_value: 420_000, monetization: 6_500, date: "2024-12-10" },
  { real_estate: real_estate1, condominium: condo2, unit: "150", negotiated_value: 310_000, monetization: 4_200, date: "2024-12-05" },
  { real_estate: real_estate1, condominium: condo3, unit: "501", negotiated_value: 390_000, monetization: 5_500, date: "2025-02-01" },
  { real_estate: real_estate2, condominium: condo4, unit: "101", negotiated_value: 500_000, monetization: 7_500, date: "2025-01-10" },
  { real_estate: real_estate2, condominium: condo5, unit: "202", negotiated_value: 450_000, monetization: 6_000, date: "2025-01-18" },
  { real_estate: real_estate2, condominium: condo4, unit: "303", negotiated_value: 480_000, monetization: 7_000, date: "2024-12-22" },
  { real_estate: real_estate2, condominium: condo5, unit: "404", negotiated_value: 430_000, monetization: 5_800, date: "2024-12-30" }
])

puts "✅ #{RealEstate.count} imobiliárias criadas com sucesso!"