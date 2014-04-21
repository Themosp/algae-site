module ApplicationHelper
  def language_flag(locale)
    {
        el: 'flags/Greece.png',
        en: 'flags/UnitedKingdom.png',
        de: 'flags/Germany.png',
        it: 'flags/Italy.png',
        es: 'flags/Spain.png',
        ar: 'flags/SaudiArabia.png'
    }[locale]
  end

  def polymorphic_select(form, method, collection, text_method, options = {}, html_options = {})
    select_options = collection.group_by(&:class).map { |klass, objects|
      [
          klass.model_name.human.pluralize,
          objects.map { |object|
            [
                object.send(text_method),
                "#{object.class.model_name}::#{object.id}"
            ]
          }
      ]
    }
    selected_option = "#{form.object.send(:"#{method}_type")}::#{form.object.send(:"#{method}_id")}"

    type_field = form.hidden_field :"#{method}_type", data: { polymorphic: 'type' }
    id_field = form.hidden_field :"#{method}_id", data: { polymorphic: 'id' }
    master_select = form.select method, grouped_options_for_select(select_options, selected_option), options, { data: { polymorphic: 'master' } }.merge(html_options)

    content_tag :span, (type_field + id_field + master_select), data: { polymorphic: true }
  end
end
