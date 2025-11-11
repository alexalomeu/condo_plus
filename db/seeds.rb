Condominium.destroy_all
RealEstate.destroy_all
Revenue.destroy_all
Manager.destroy_all 

puts "Limpando o banco de dados..."
ActiveRecord::Base.connection.disable_referential_integrity do
  [Manager, Condominium, Revenue].each(&:delete_all)
end
puts "Banco limpo com sucesso!"

puts "🏢 Criando imobiliárias..."

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

puts "🌇 Criando condomínios de exemplo..."

condominiums = [
  {
    real_estate: real_estate1,
    nome: "Residencial Sol Nascente",
    unidades_por_torre: 20,
    nomes_torres: "Torre A, Torre B, Torre C",
    tipo: "residencial",
    data_construcao: "2015-06-15",
    area_total: 15000.0,
    area_comum: 3000.0,
    valor_condominio: 550.50,
    taxa_administrativa: 50.0,
    endereco: "Rua das Flores",
    numero: "123",
    bairro: "Jardim das Acácias",
    cidade: "São Paulo",
    estado: "SP",
    cep: "01234-567",
    latitude: -23.550520,
    longitude: -46.633308,
    piscina: true,
    churrasqueira: true,
    playground: true,
    academia: true,
    estacionamento_coberto: 30,
    estacionamento_descoberto: 10,
    portaria_24h: true,
    elevadores: 6,
    email_administracao: "contato@solnascente.com",
    telefone_administracao: "(11) 98765-4321",
    created_at: Date.today
  },
  {
    real_estate: real_estate2,
    nome: "Edifício Horizonte Azul",
    unidades_por_torre: 15,
    nomes_torres: "Torre Norte, Torre Sul",
    tipo: "residencial",
    data_construcao: "2018-03-20",
    area_total: 12000.0,
    area_comum: 2500.0,
    valor_condominio: 620.75,
    taxa_administrativa: 55.0,
    endereco: "Av. Central",
    numero: "500",
    bairro: "Centro",
    cidade: "Rio de Janeiro",
    estado: "RJ",
    cep: "20000-000",
    latitude: -22.906847,
    longitude: -43.172896,
    piscina: true,
    churrasqueira: false,
    playground: true,
    academia: true,
    estacionamento_coberto: 25,
    estacionamento_descoberto: 15,
    portaria_24h: true,
    elevadores: 4,
    email_administracao: "contato@horizonteazul.com",
    telefone_administracao: "(21) 91234-5678",
    created_at: Date.today
  },
  {
    real_estate: real_estate1,
    nome: "Condomínio Vila Verde",
    unidades_por_torre: 10,
    nomes_torres: "Torre Única",
    tipo: "residencial",
    data_construcao: "2012-11-10",
    area_total: 8000.0,
    area_comum: 2000.0,
    valor_condominio: 450.0,
    taxa_administrativa: 40.0,
    endereco: "Rua Verde",
    numero: "45",
    bairro: "Vila Nova",
    cidade: "Belo Horizonte",
    estado: "MG",
    cep: "30123-456",
    latitude: -19.9245,
    longitude: -43.9352,
    piscina: false,
    churrasqueira: true,
    playground: true,
    academia: false,
    estacionamento_coberto: 12,
    estacionamento_descoberto: 5,
    portaria_24h: true,
    elevadores: 2,
    email_administracao: "contato@vilaverde.com",
    telefone_administracao: "(31) 99876-5432",
    created_at: Date.today
  },
  {
    real_estate: real_estate2,
    nome: "Residencial Mar Azul",
    unidades_por_torre: 18,
    nomes_torres: "Torre 1, Torre 2, Torre 3, Torre 4",
    tipo: "residencial",
    data_construcao: "2020-01-05",
    area_total: 18000.0,
    area_comum: 4000.0,
    valor_condominio: 700.0,
    taxa_administrativa: 60.0,
    endereco: "Av. do Mar",
    numero: "777",
    bairro: "Praia do Sol",
    cidade: "Fortaleza",
    estado: "CE",
    cep: "60000-000",
    latitude: -3.71722,
    longitude: -38.5431,
    piscina: true,
    churrasqueira: true,
    playground: true,
    academia: true,
    estacionamento_coberto: 50,
    estacionamento_descoberto: 20,
    portaria_24h: true,
    elevadores: 8,
    email_administracao: "contato@marazul.com",
    telefone_administracao: "(85) 91234-5678",
    created_at: Date.today
  },
  {
    real_estate: real_estate1,
    nome: "Edifício Serra Dourada",
    unidades_por_torre: 12,
    nomes_torres: "Torre A, Torre B",
    tipo: "residencial",
    data_construcao: "2016-07-22",
    area_total: 10000.0,
    area_comum: 2500.0,
    valor_condominio: 500.0,
    taxa_administrativa: 45.0,
    endereco: "Rua das Montanhas",
    numero: "200",
    bairro: "Serra",
    cidade: "Curitiba",
    estado: "PR",
    cep: "80000-000",
    latitude: -25.4284,
    longitude: -49.2733,
    piscina: true,
    churrasqueira: true,
    playground: true,
    academia: false,
    estacionamento_coberto: 20,
    estacionamento_descoberto: 10,
    portaria_24h: true,
    elevadores: 4,
    email_administracao: "contato@serradourada.com",
    telefone_administracao: "(41) 98765-4321",
    created_at: Date.today
  }
]

condominiums.each do |attrs|
  Condominium.find_or_create_by!(nome: attrs[:nome]) do |condo|
    condo.assign_attributes(attrs)
  end
end

puts "💰 Criando receitas (revenues)..."

Condominium.all.each do |c|
  2.times do |i|
    Revenue.create!(
      condominium: c,
      unit: "Unidade #{rand(1..100)}",
      tower: "Torre #{('A'..'Z').to_a.sample}",
      negotiated_value: rand(200_000..800_000),
      monetization: rand(5_000..20_000),
      date: Date.today - (i * 30)
    )
  end
end

puts "🧑‍💼 Criando managers..."

teams = [
  "VENDA - ORATÓRIO",
  "VENDA - PARQUE",
  "VENDA - PIRES",
  "VENDA - CAMPESTRE",
  "VENDA - GILDA",
  "VENDA - MKT"
]

week_schedule = [
  { day: "Domingo", available: false, hours: "" },
  { day: "Segunda-feira", available: true, hours: "09:00 - 17:00" },
  { day: "Terça-feira", available: true, hours: "09:00 - 17:00" },
  { day: "Quarta-feira", available: true, hours: "09:00 - 17:00" },
  { day: "Quinta-feira", available: true, hours: "09:00 - 17:00" },
  { day: "Sexta-feira", available: true, hours: "09:00 - 17:00" },
  { day: "Sábado", available: true, hours: "09:00 - 17:00" }
]

Condominium.all.each_with_index do |condo, i|
  Manager.create!(
    condominium: condo,
    name: ["João Almeida", "Marina Costa", "Ricardo Tavares", "Fernanda Souza", "Paulo Henrique"][i],
    cpf: "123.456.789-0#{i}",
    phone: "(11) 9#{rand(1000..9999)}-#{rand(1000..9999)}",
    email: "manager#{i + 1}@#{condo.nome.parameterize}.com",
    gender: ["Masculino", "Feminino"].sample,
    birth_date: Date.new(1980 + i, rand(1..12), rand(1..28)),
    marital_status: ["Solteiro(a)", "Casado(a)", "Divorciado(a)"].sample,
    admission_date: Date.today - rand(200..1000),
    contract_type: ["CLT", "Autônomo", "Prestador"].sample,
    creci: "CRECI-#{rand(10000..99999)}",
    address: "Rua #{['das Palmeiras', 'dos Limoeiros', 'das Hortências', 'das Rosas'].sample}",
    neighborhood: "Bairro #{['Central', 'Novo Horizonte', 'Alto da Serra', 'Jardim América'].sample}",
    city: condo.cidade,
    number: rand(1..500).to_s,
    zip_code: "#{rand(10000..99999)}-#{rand(100..999)}",
    complement: "Apto #{rand(1..100)}",
    courses: ["Administração condominial", "Gestão de pessoas", "Segurança patrimonial"].sample,
    selected_teams: teams.sample(2),
    week_schedule: week_schedule
  )
end

puts "✅ Seed completo!"

