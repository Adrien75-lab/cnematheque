<?php

namespace App\Form;

use App\Entity\Acteur;
use App\Entity\Categorie;
use Symfony\Component\Form\AbstractType;
use Symfony\Component\Form\FormBuilderInterface;
use Symfony\Bridge\Doctrine\Form\Type\EntityType;
use Symfony\Component\OptionsResolver\OptionsResolver;
use Symfony\Component\Form\Extension\Core\Type\IntegerType;
use Symfony\Component\Form\Extension\Core\Type\TextType;

class SearchFilmType extends AbstractType
{
    public function buildForm(FormBuilderInterface $builder, array $options)
    {
        $builder
            ->add('categories', EntityType::class, [
                'class' => Categorie::class,
                'label' => false,
                'required' => false,
                'multiple' => true,
                'attr' => [
                    'class' => 'js-categories-multiple'
                ]
            ])
            ->add('acteurs', EntityType::class, [
                'class' => Acteur::class,
                'label' => false,
                'required' => false,
                'multiple' => true,
                'attr' => [
                    'class' => 'js-categories-multiple'
                ]
            ])

            ->add('tags', TextType::class, [
                'label' => false,
                'required' => false,
                'attr' => [
                    'placeholder' => 'tags ...'
                ]
            ]);
    }

    public function configureOptions(OptionsResolver $resolver)
    {
        $resolver->setDefaults([
            // Configure your form options here
        ]);
    }
}
