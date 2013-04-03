# encoding: UTF-8

require 'spec_helper'

feature 'Una persona sorda accede a una web y ' do

  before do
    load "#{Rails.root}/db/seeds.rb"
  end

  scenario 'gestiona los ciclos de vida de una factura' do
    # El semáforo está en amarillo
    # TODO: De momento no comprobemos que está amarillo
    visit '/test.html'
    page.should have_content 'El ayuntamiento de Metropolis'
    # Hace clic en el semáforo
    page.find('#semaforo').click
    # Ve el texto "En Sígname puedes solicitar que un intérprete signe una página de Internet"
    page.should have_content "En Sígname puedes solicitar que un intérprete signe una página de Internet"
    # Rellena el formulario y pulsa solicitar
    fill_in 'pagina[url]', :with => 'http://www.google.com'
    fill_in 'pagina[email_solicitante]', :with => 'tecnicos@unoycero.com'
    click_on 'Solicitar'
    # Ve el mensaje "Muchas gracias por su solicitud, te avisamos por email en cuanto esté disponible"
    page.should have_content "Muchas gracias por su solicitud, te avisamos por email en cuanto esté disponible"

  end
end
