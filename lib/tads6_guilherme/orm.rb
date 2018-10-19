require "yaml"
require "fileutils"

module Tads6_Guilherme

  class ORM
  def self.criar(*atributos)
    id = proximo_id
    File.open("#{path}/#{id}.yml", "a") do |arquivo|
      obj = self.new atributos
      obj.id = id
      arquivo.puts YAML.dump obj
      return id
    end
  end

  def self.listar
    @objs = []
    $/ = '\n\n'

    (1..ultimo_id).each do |id|
      _path = "#{path}/#{id}.yml"
      if File.exist?(_path)
        File.open(_path, "r").each do |obj|
          @objs << YAML.load(obj)
        end
      end
    end

    @objs
  end

  def self.selecionar(id)
    listar.each do |obj|
      return obj if obj.id == id
    end
  end

  def self.atualizar(obj)
    FileUtils.rm "#{path}/#{obj.id}.yml"
    File.open("#{path}/#{obj.id}.yml", "a") do |arquivo|
      arquivo.puts YAML.dump obj
      return obj.id
    end
  end

  def self.remove(id)
    FileUtils.rm "#{path}/#{id}.yml"
    return id
  end

  private

  def self.quantidade_registros
    Dir.glob("#{path}/*.yml").size + 1
  end

  def self.ultimo_id
    files = Dir.entries("#{path}").sort_by do |file|
      File.ctime("#{path}/#{file}")
    end
    File.basename("#{path}/#{files.last}", ".yml").to_i
  end

  def self.path
    "db/#{self.to_s.downcase}"
  end

  def self.proximo_id
    ultimo_id.to_i + 1
  end
end
end
