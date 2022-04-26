<?php

namespace App\Controller;

use App\Entity\Films;
use App\Entity\SearchFilms;
use App\Form\SearchFilmType;
use App\Repository\FilmsRepository;
use App\Repository\ActeurRepository;
use App\Repository\CategorieRepository;
use Symfony\Component\HttpFoundation\Request;
use Symfony\Component\HttpFoundation\Response;
use Symfony\Component\Routing\Annotation\Route;
use Symfony\Bundle\FrameworkBundle\Controller\AbstractController;
use App\Repository\HomeSliderRepository;

class HomeController extends AbstractController
{
    /**
     * @Route("/", name="home")
     */
    public function index(
        FilmsRepository $repoFilms,
        CategorieRepository $repoCategory,

        ActeurRepository $repoActeur,
        HomeSliderRepository $repoHomeSlider
    ): Response {
        $films = $repoFilms->findAll();
        $filmBestSeller = $repoFilms->findByIsBestSeller(1);
        $categories = $repoCategory->findAll();
        $acteurs = $repoActeur->findAll();
        $homeSlider = $repoHomeSlider->findBy(['isDisplayed' => true]);




        return $this->render('home/index.html.twig', [
            'controller_name' => 'HomeController',
            'film' => $films,
            'filmBestSeller' => $filmBestSeller,
            'categories' => $categories,
            'acteurs' => $acteurs,
            'homeSlider' => $homeSlider,

        ]);
    }
    /**
     *@Route("/Film{slug}",name="film_details")
     * 
     */
    public function show(?Films $film): Response
    {

        if (!$film) {
            return $this->redirectToRoute("home");
        }
        return $this->render("home/single_film.html.twig", [
            'film' => $film
        ]);
    }



    /**
     * @Route("/shop",name="shop")
     *
     */
    public function shop(FilmsRepository $repoFilms, Request $request): Response

    {

        $search = new SearchFilms();

        $form = $this->createForm(SearchFilmType::class, $search);
        $films = $repoFilms->findAll();
        $form->handleRequest($request);

        if ($form->isSubmitted() && $form->isValid()) {
            $films = $repoFilms->findWithSearch($search);
        }




        return $this->render('home/shop.html.twig', [

            'films' => $films,
            'search' => $form->createView(),


        ]);
    }
    /**
     *@Route("/Film{slug}",name="film_details")
     * 
     */
}
