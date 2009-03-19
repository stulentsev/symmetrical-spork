class AddLanguages < ActiveRecord::Migration
  def self.up
    # Adicionar linguagens especificais
    Language.create(:kind => 1, :name => 'Vídeo')
    Language.create(:kind => 1, :name => 'Fotografia')
    Language.create(:kind => 1, :name => 'Design')
    Language.create(:kind => 1, :name => 'Comp. gráfica')
    Language.create(:kind => 1, :name => 'Webdesign')
  end

  def self.down
  end
end
