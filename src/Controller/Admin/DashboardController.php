<?php

namespace App\Controller\Admin;

use App\Entity\Acteur;
use App\Entity\Categorie;
use App\Entity\Films;
use App\Entity\HomeSlider;
use App\Entity\User;
use EasyCorp\Bundle\EasyAdminBundle\Config\Dashboard;
use EasyCorp\Bundle\EasyAdminBundle\Config\MenuItem;
use EasyCorp\Bundle\EasyAdminBundle\Controller\AbstractDashboardController;
use Symfony\Component\HttpFoundation\Response;
use Symfony\Component\Routing\Annotation\Route;

class DashboardController extends AbstractDashboardController
{
    /**
     * @Route("/admin", name="admin")
     */
    public function index(): Response
    {
        return parent::index();
    }

    public function configureDashboard(): Dashboard
    {
        return Dashboard::new()
            ->setTitle('Cinematheque');
    }

    public function configureMenuItems(): iterable
    {
        yield MenuItem::linkToDashboard('Dashboard', 'fa fa-home');
        yield MenuItem::linktoCrud('Films', 'fas fa-shopping-cart', Films::class);
        yield MenuItem::linktoCrud('Categories', 'fas fa-shopping-cart', Categorie::class);
        yield MenuItem::linktoCrud('Acteurs', 'fas fa-shopping-cart', Acteur::class);
        yield MenuItem::linktoCrud('HomeSlider', 'fas fa-shopping-cart', HomeSlider::class);
        yield MenuItem::linktoCrud('Utilisateurs', 'fas fa-shopping-cart', User::class);
    }
}
