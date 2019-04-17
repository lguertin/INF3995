////////////////////////////////////////////////////////////////////////////////
/// \file       OnlineRepo.h
/// \authors   INF3995 Equipe (03)
///            Christella Cidolit 
///            Issifath Sanni
///            Anis Redjdal   
///            Léandre Guertin
///            Constantin Bouis
/// \Description
///         Classe OnlineRepo contenant les objets DynamicPage 
///         que l'on va ajouter dans le repository de notre WebServeur
////////////////////////////////////////////////////////////////////////////////

#define HTTP_HEADER "HTTP/1.1 200 OK\r\nContent-Type: text/html; charset=utf-10"
#define REQUEST_1 "Ceci est notre test 1 !"
#define REQUEST_2 "<a href=\"http://www.polymtl.ca\">Poly Mtl</a>"
#define REQUEST_3 "<html><body><div style=\"width:image 100 px; font-size:80%; text-align:center;\">" \
                  "<img src=\"img/cat.png\" alt=\"alternate text\" width=\"width\" height=\"height\" style=\"padding-bottom:0.5em;\">" \
                  "<span style=\"vertical-align: middle\"><h1>Meow !</h1></span></div></body></html>"

#define TEST1 "test1"
#define TEST2 "test2"
#define TEST3 "test3"

#include <libnavajo/libnavajo.hh>
using namespace std;


////////////////////////////////////////////////////////////////////////////////
/// \Class         : OnlineRepo
/// \Description   : Defines the online repository where dynamic pages are stored
/// \Attributes    : None
/// \Functions     :
///         - add( const string url, Dynamic *page)
/// \Contained class: 
///         - Dynamic Page    
////////////////////////////////////////////////////////////////////////////////
class OnlineRepo : public DynamicRepository
{
    /////////////////////////////////////////////////////////////////////////////////////
    /// \Class         : TestPage
    /// \Description   : Defines the dynamic page that corresponds to an url
    /// \Attributes    : None
    /// \Functions     :
    ///         - getPage(HttpRequest* request, HttpResponse *response)
    ///                 
    ////////////////////////////////////////////////////////////////////////////////
    class TestPage: public DynamicPage
    {
        bool getPage(HttpRequest* request, HttpResponse *response)
        {
            // prints logging infos
            NVJ_LOG->append(NVJ_INFO, "New Request from " + request->getPeerIpAddress().str() + " : " + request->getUrl());
            response->addSpecificHeader(HTTP_HEADER);
            
            // defines which content is shown according to the entered url
            if (string(request->getUrl()) == TEST1)
                return fromString(REQUEST_1, response);
            if (string(request->getUrl()) == TEST2)
                return fromString(REQUEST_2, response);
            if (string(request->getUrl()) == TEST3)
                return fromString(REQUEST_3, response);

            return false;
        }
    } testPage;
    
    public:
        OnlineRepo() : DynamicRepository()
        {
            // adds dynamic pages 
            add(TEST1,&testPage);    
            add(TEST2,&testPage);
            add(TEST3,&testPage);
        }
};
