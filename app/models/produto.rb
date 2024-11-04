class Produto < ApplicationRecord

  before_validation :quantidade_menor_que_0

  validates :nome, :quantidade, presence: true
  validates :nome, length: { minimum: 3, maximum: 50 }, format: { with: /\A[a-zA-Z]+\z/, message: "Apenas letras são permitidas" }
  # REGEX: \A -> Inicio da string, [a-zA-Z] -> Letras de A a Z, + -> 1 ou mais, \z -> Fim da string
  validates :quantidade, numericality: { only_integer: true, greater_than: 0 , message: "Apenas números inteiros são permitidos" }

  private

  def quantidade_menor_que_0
    if quantidade.nil? || quantidade < 0
      puts "Quantidade não pode ser nulo ou menor que 0, setando para 0"
      self.quantidade = 0
    end
  end

end
