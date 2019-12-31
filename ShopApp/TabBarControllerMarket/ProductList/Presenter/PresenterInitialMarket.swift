//
//  PresenterInitialMarket.swift
//  ShopApp
//
//  Created by Mike on 21/12/19.
//  Copyright © 2019 Mike. All rights reserved.
//

import Foundation

///Presenter -> View protocol
protocol InitialMarketPresenterToViewProtocol: NSObject
{
    func displayDataSource(dataSource: [MarketProductsCellsProtocol])
    func showMesssage(title: String, body: String)
}

class PresenterInitialMarket
{
//    private let dataSourceManager:
    //MARK: - variables
    weak private var delegate: InitialMarketPresenterToViewProtocol?
    
    func setViewDelegate(viewDelegate: InitialMarketPresenterToViewProtocol)
    {
        self.delegate = viewDelegate
    }
    
}

//MARK: - Public methods
extension PresenterInitialMarket
{
    /**
     This functionv ladiate the dataSource if is not empty
     **/
    public func validateIfEmptyDataSource(dataSource: [MarketProductsCellsProtocol]?)
    {
        guard let dataSource = dataSource else {
            print("Error Couldn't set let dataSource = dataSource")
            return
        }
        if dataSource.isEmpty{
            self.delegate?.showMesssage(title: "Aviso", body: "No hay productos")
        }
    }
    
    /**
     This funciton add the dummy data
     **/
    public func getDataSource()
    {
        var dataSource = [MarketProductsCellsProtocol]()
        //load dummy data
        let imac = InitialProductCellModel(productName: "iMac Apple 21.5", productPrice: "19,999.99", productSKU: "AAAA-erfg-456-MIKE", imageName: "imac",extensionFile:  "jpeg", description: "El iMac Pro encierra toda su potencia detrás de una espectacular pantalla Retina 5K, y su elegante carcasa solo mide 5 mm de grosor en el borde. Además, como funciona con un solo cable, mantiene despejado tu espacio de trabajo. Es una herramienta diseñada hasta el último detalle para que puedas centrarte en crear y olvidarte de todo lo demás. iMac es sinónimo de pantalla espectacular. El diseño estilizado todo-en-uno casi desaparece detrás de la impresionante pantalla, y así tú puedes centrarte en lo que quieres hacer. Si a eso le sumas una gama cromática P3 y compatibilidad con mil millones de colores, te faltarán palabras para explicar sus imágenes. El chip T2 rediseña e integra varios componentes de otros ordenadores Mac (como el controlador de gestión del sistema, el procesador de señal de imagen o los controladores de audio y SSD) para ofrecer otras prestaciones. Por ejemplo, el procesador de señal de imagen del chip T2 funciona con la cámara FaceTime HD y permite un mapeo de tonos mejorado, un control de exposición más preciso y una automatización de la exposición y el balance de blancos basada en la detección facial.")
        let imac1 = InitialProductCellModel(productName: "iMac Apple 27", productPrice: "116,999.00", productSKU: "AABA-erfg-456-MIKE", imageName: "imac1",extensionFile:  "jpeg", description: "El iMac Pro encierra toda su potencia detrás de una espectacular pantalla Retina 5K, y su elegante carcasa solo mide 5 mm de grosor en el borde. Además, como funciona con un solo cable, mantiene despejado tu espacio de trabajo. Es una herramienta diseñada hasta el último detalle para que puedas centrarte en crear y olvidarte de todo lo demás. iMac es sinónimo de pantalla espectacular. El diseño estilizado todo-en-uno casi desaparece detrás de la impresionante pantalla, y así tú puedes centrarte en lo que quieres hacer. Si a eso le sumas una gama cromática P3 y compatibilidad con mil millones de colores, te faltarán palabras para explicar sus imágenes. El chip T2 rediseña e integra varios componentes de otros ordenadores Mac (como el controlador de gestión del sistema, el procesador de señal de imagen o los controladores de audio y SSD) para ofrecer otras prestaciones. Por ejemplo, el procesador de señal de imagen del chip T2 funciona con la cámara FaceTime HD y permite un mapeo de tonos mejorado, un control de exposición más preciso y una automatización de la exposición y el balance de blancos basada en la detección facial.")
        let macbook = InitialProductCellModel(productName: "MacBook", productPrice: "30000", productSKU: "AAAA-frgh-456-MIKE", imageName: "macbook",extensionFile:  "jpg",description: "La última MacBook Air presenta una impresionante pantalla Retina con tecnología True Tone, Touch ID, el último teclado diseñado por Apple y un trackpad Force Touch, todo alojado en un diseño de cuña icónico delgado y ligero hecho de aluminio 100 por ciento reciclado. Con duración de la batería de hasta 12 horas, es una computadora portátil que funciona todo el día.")
        let macbookAir = InitialProductCellModel(productName: "Apple MacBook Air", productPrice: "23,999.00", productSKU: "BBBB-erfg-456-MIKE", imageName: "macbookair",extensionFile:  "jpeg", description: "La última MacBook Air presenta una impresionante pantalla Retina con tecnología True Tone, Touch ID, el último teclado diseñado por Apple y un trackpad Force Touch, todo alojado en un diseño de cuña icónico delgado y ligero hecho de aluminio 100 por ciento reciclado. Con duración de la batería de hasta 12 horas, es una computadora portátil que funciona todo el día")
        let macbookAir1 = InitialProductCellModel(productName: "MacBook Air 13", productPrice: "20,999.00", productSKU: "CCCC-erfg-456-MIKE", imageName: "macbookair1",extensionFile:  "jpg", description: "Sistema operativo MacOS High Sierra,Memoria RAM de 8 GB,Pantalla de gran resolución")
        let screen = InitialProductCellModel(productName: "Pantalla Full HD", productPrice: "116,999.00", productSKU: "DDDD-erfg-456-MIKE", imageName: "pantalla1",extensionFile:  "jpeg", description: "Full HD, la alta definición es el nuevo estándar en la televisión digital, Conecta tu memoria USB y disfruta al instante de tu contenido multimedia, Navega entre tus aplicaciones favoritas con Smart TV")
        let screen1 = InitialProductCellModel(productName: "Pantalla 1080p", productPrice: "116,999.00", productSKU: "PPPP-erfg-456-MIKE", imageName: "pantalla2",extensionFile:  "jpg", description: "Full HD, la alta definición es el nuevo estándar en la televisión digital, Conecta tu memoria USB y disfruta al instante de tu contenido multimedia, Navega entre tus aplicaciones favoritas con Smart TV")
        let screen2 = InitialProductCellModel(productName: "Smart TV", productPrice: "116,999.00", productSKU: "LLLL-erfg-456-MIKE", imageName: "pantalla3",extensionFile:  "jpg", description: "Full HD, la alta definición es el nuevo estándar en la televisión digital, Conecta tu memoria USB y disfruta al instante de tu contenido multimedia, Navega entre tus aplicaciones favoritas con Smart TV")
        let screen3 = InitialProductCellModel(productName: "Smart TV 4K", productPrice: "116,999.00", productSKU: "AAAA-erfg-980-MIKE", imageName: "pantalla4",extensionFile:  "jpg",description: "Full HD, la alta definición es el nuevo estándar en la televisión digital, Conecta tu memoria USB y disfruta al instante de tu contenido multimedia, Navega entre tus aplicaciones favoritas con Smart TV")
        let screen4 = InitialProductCellModel(productName: "Smart TV Full HD", productPrice: "116,999.00", productSKU: "LOLL-erfg-456-MIKE", imageName: "pantalla5",extensionFile:  "jpg", description: "Full HD, la alta definición es el nuevo estándar en la televisión digital, Conecta tu memoria USB y disfruta al instante de tu contenido multimedia, Navega entre tus aplicaciones favoritas con Smart TV")

        
        dataSource.append(imac)
        dataSource.append(imac1)
        dataSource.append(macbook)
        dataSource.append(macbookAir)
        dataSource.append(macbookAir1)
        dataSource.append(screen)
        dataSource.append(screen1)
        dataSource.append(screen2)
        dataSource.append(screen3)
        dataSource.append(screen4)

        self.delegate?.displayDataSource(dataSource: dataSource)
    }
}
